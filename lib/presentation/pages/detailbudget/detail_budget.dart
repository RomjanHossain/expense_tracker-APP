import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/presentation/pages/detailbudget/components/delete_budget_sheet.dart';
import 'package:expense_tracker/presentation/widgets/amount_progress_indicator.dart';
import 'package:expense_tracker/presentation/widgets/category_with_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBudget extends StatelessWidget {
  const DetailBudget({super.key, required this.budget});
  final Budget budget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode(context)
            ? ExpenseTrackerColors.dark
            : ExpenseTrackerColors.light,
        title: const Text('Detail Budget'),
        actions: [
          // delete
          IconButton(
            onPressed: () async {
              // show bottom modal dialog
              await showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  return RemoveBudgetSheet(
                    id: budget.id,
                  );
                },
              );
            },
            icon: const Icon(
              CupertinoIcons.delete,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryWithBorder(
                      color: ExpenseTrackerColors.blue,
                      title: budget.category,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 8.h,
                  ),
                  child: Text(
                    'Remaining',
                    style: ExpenseTrackerTextStyle.title2.copyWith(
                      color: isDarkMode(context)
                          ? ExpenseTrackerColors.light
                          : ExpenseTrackerColors.dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  '\$${budget.remaining}',
                  style: ExpenseTrackerTextStyle.titleX.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode(context)
                        ? ExpenseTrackerColors.light
                        : ExpenseTrackerColors.dark,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 8.h,
                  ),
                  child: AmountProgressIndicator(
                    color: ExpenseTrackerColors.yellow,
                    value: budget.spent / budget.amount,
                  ),
                ),
                if (budget.remaining < 1)
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: ExpenseTrackerColors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          // color: ExpenseTrackerColors.light,
                          color: ExpenseTrackerColors.light,
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          'You’ve exceed the limit',
                          style: TextStyle(
                            color: ExpenseTrackerColors.light,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Edit')),
          ],
        ),
      ),
    );
  }
}
