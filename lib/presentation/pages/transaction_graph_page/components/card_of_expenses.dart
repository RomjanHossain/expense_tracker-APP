import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/core/utils/utils.dart';

import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOfExpense2 extends StatelessWidget {
  const CardOfExpense2({
    required this.cardOfExpense,
    super.key,
  });

  final IEmodel cardOfExpense;

  @override
  Widget build(BuildContext context) {
    final icon = getIcon(cardOfExpense.isIncome);
    final title = getTitle(cardOfExpense.isIncome);
    final description = getDescription(cardOfExpense.isIncome);
    final amount = getAmmount(cardOfExpense.isIncome);
    debugPrint('type : ${cardOfExpense.isIncome}');
    return Card(
      color: !isDarkMode(context)
          ? ExpenseTrackerColors.light
          : ExpenseTrackerColors.dark,
      elevation: 0,
      child: ListTile(
        leading: AnimatedContainer(
          // height: 40.h,
          width: 50.w,
          decoration: BoxDecoration(
            // color: ExpenseTrackerColors.violet20,
            color: generatingRandomColor().withOpacity(0.2),
            borderRadius: BorderRadius.circular(15).r,
          ),
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 500),
          child: Text(
            icon,
            style: ExpenseTrackerTextStyle.title3.copyWith(
              fontWeight: FontWeight.w600,
              color: ExpenseTrackerColors.violet,
            ),
            textAlign: TextAlign.center,
          ),
          // color: ExpenseTrackerColors.violet,
        ),
        title: Text(
          title,
          style: ExpenseTrackerTextStyle.body3.copyWith(
            fontWeight: FontWeight.w600,
            // color: ExpenseTrackerColors.dark25,
            color: !isDarkMode(context)
                ? ExpenseTrackerColors.dark25
                : ExpenseTrackerColors.light,
            letterSpacing: 0.5,
          ),
        ),
        subtitle: Text(
          description,
          style: ExpenseTrackerTextStyle.small.copyWith(
            color: ExpenseTrackerColors.light20,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // amount
            Text(
              '${cardOfExpense.isIncome == ExpenseType.income ? "+" : "-"}\$$amount',
              style: ExpenseTrackerTextStyle.body3.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: cardOfExpense.isIncome == ExpenseType.income
                    ? ExpenseTrackerColors.green
                    : ExpenseTrackerColors.red,
              ),
            ),
            // date
            Text(
              getDate(cardOfExpense.isIncome),
              style: ExpenseTrackerTextStyle.small.copyWith(
                color: ExpenseTrackerColors.light20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //!INFO: get the ammount
  double getAmmount(ExpenseType type) {
    switch (type) {
      case ExpenseType.income:
        return cardOfExpense.income?.ammount ?? 0.0;
      case ExpenseType.expense:
        return cardOfExpense.expense?.ammount ?? 0.0;
      case ExpenseType.transfer:
        return cardOfExpense.transfer?.ammount ?? 0.0;
    }
  }

  //!INFO: get the created date
  String getDate(ExpenseType type) {
    switch (type) {
      case ExpenseType.income:
        return getHumanReadableDate(
          cardOfExpense.income?.createdDate ?? DateTime.now(),
        );
      case ExpenseType.expense:
        return getHumanReadableDate(
          cardOfExpense.expense?.createdDate ?? DateTime.now(),
        );
      case ExpenseType.transfer:
        return getHumanReadableDate(
          cardOfExpense.transfer?.createdDate ?? DateTime.now(),
        );
    }
  }

  //!INFO: get the description
  String getDescription(ExpenseType type) {
    switch (type) {
      case ExpenseType.income:
        return cardOfExpense.income?.description ?? '';
      case ExpenseType.expense:
        return cardOfExpense.expense?.description ?? '';
      case ExpenseType.transfer:
        return cardOfExpense.transfer?.description ?? '';
    }
  }

  //! INFO: get the title of the category
  String getTitle(ExpenseType type) {
    switch (type) {
      case ExpenseType.income:
        final income = cardOfExpense.income;
        if (income != null) {
          return ExpenseTrackerCategories.incomeMethods
              .firstWhere(
                (element) => element.id == income.categoryID,
              )
              .title;
        } else {
          return 'No category';
        }

      case ExpenseType.expense:
        final expense = cardOfExpense.expense;
        if (expense != null) {
          return categoryLocalData2
              .firstWhere(
                (element) => element.id == expense.categoryID,
              )
              .title;
        } else {
          return 'No category';
        }
      case ExpenseType.transfer:
        final transfer = cardOfExpense.transfer;
        if (transfer != null) {
          return transfer.to ?? 'Unknown Person';
        } else {
          return 'Unknown Person';
        }
    }
  }

  //! INFO: get incom
  String getIcon(ExpenseType type) {
    switch (type) {
      case ExpenseType.income:
        final income = cardOfExpense.income;
        if (income != null) {
          return ExpenseTrackerCategories.incomeMethods
              .firstWhere(
                (element) => element.id == income.categoryID,
              )
              .icon;
        } else {
          return '💰';
        }

      case ExpenseType.expense:
        final expense = cardOfExpense.expense;
        if (expense != null) {
          return categoryLocalData2
              .firstWhere(
                (element) => element.id == expense.categoryID,
              )
              .icon;
        } else {
          return '💸';
        }
      case ExpenseType.transfer:
        return '🔁';
    }
  }
}
