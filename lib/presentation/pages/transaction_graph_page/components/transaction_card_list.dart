import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils_.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/view/expensedetails_page.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TransactionCardList extends StatelessWidget {
  const TransactionCardList({required this.allIEmodel, super.key});
  final List<IEmodel> allIEmodel;

  Map<String, List<IEmodel>> groupModelsByMonthYear(List<IEmodel> models) {
    // Create a map where keys are categories and values are lists of models
    final groupedData = <String, List<IEmodel>>{};

    // Define date boundaries
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final weekStart = today.subtract(Duration(days: today.weekday - 1));
    final monthStart = DateTime(today.year, today.month);

    for (final model in models) {
      // Format the date as "MMMM yyyy" (e.g., "January 2025") for month/year grouping
      final monthYear = DateFormat('MMMM yyyy').format(model.createdAt);

      // Categorize model
      if (model.createdAt.isAfter(today)) {
        groupedData.putIfAbsent('Today', () => []).add(model);
      } else if (model.createdAt.isAfter(yesterday) &&
          model.createdAt.isBefore(today)) {
        groupedData.putIfAbsent('Yesterday', () => []).add(model);
      } else if (model.createdAt.isAfter(weekStart) &&
          model.createdAt.isBefore(today)) {
        groupedData.putIfAbsent('This Week', () => []).add(model);
      } else if (model.createdAt.isAfter(monthStart) &&
          model.createdAt.isBefore(today)) {
        groupedData.putIfAbsent('This Month', () => []).add(model);
      } else {
        groupedData.putIfAbsent(monthYear, () => []).add(model);
      }
    }

    // Ensure all lists are sorted by date (newest first)
    for (final key in groupedData.keys) {
      groupedData[key]!.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    // Sort the keys: predefined categories first, then months/years
    final predefinedCategories = [
      'Today',
      'Yesterday',
      'This Week',
      'This Month',
    ];
    final otherKeys = groupedData.keys
        .where((key) => !predefinedCategories.contains(key))
        .toList()
      ..sort(
        (a, b) => DateFormat('MMMM yyyy')
            .parse(b)
            .compareTo(DateFormat('MMMM yyyy').parse(a)),
      );

    // Combine the sorted keys
    final sortedKeys = [
      ...predefinedCategories.where(groupedData.containsKey),
      ...otherKeys,
    ];

    // Return a sorted map
    return Map.fromEntries(
      sortedKeys.map((key) => MapEntry(key, groupedData[key]!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final entry in groupModelsByMonthYear(allIEmodel).entries) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(entry.key, context: context),
              _buildListView(entry.value, context: context),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ],
    );
  }

  Widget _buildTitle(String title, {required BuildContext context}) {
    debugPrint('Title -> $title');
    return Text(
      title,
      style: ExpenseTrackerTextStyle.title3.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: !isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
      ),
    );
  }

  Widget _buildListView(
    List<IEmodel> iemodels, {
    required BuildContext context,
  }) {
    return Column(
      children: iemodels
          .map(
            (currentItem) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  ExpensedetailsPage.route(currentItem),
                );
              },
              child: CardOfExpense2(
                cardOfExpense: currentItem,
              ),
            ),
          )
          .toList(),
    );
  }
}
