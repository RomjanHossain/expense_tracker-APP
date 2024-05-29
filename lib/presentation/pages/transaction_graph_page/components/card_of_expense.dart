import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/domain/entities/card_of_expense/card_of_expense_entity.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOfExpense extends StatelessWidget {
  const CardOfExpense({
    required this.cardOfExpense,
    super.key,
  });
  final CardOfExpenseEntity cardOfExpense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: !isDarkMode(context)
          ? ExpenseTrackerColors.light
          : ExpenseTrackerColors.dark,
      elevation: 0,
      child: ListTile(
        leading: Container(
          // height: 40.h,
          width: 50.w,

          decoration: BoxDecoration(
            color: ExpenseTrackerColors.violet20,
            borderRadius: BorderRadius.circular(15).r,
          ),
          alignment: Alignment.center,
          child: Text(
            categoryLocalData2
                .firstWhere(
                  (element) => element.id == cardOfExpense.title,
                )
                .icon,
            style: ExpenseTrackerTextStyle.title3.copyWith(
              fontWeight: FontWeight.w600,
              color: ExpenseTrackerColors.violet,
            ),
            textAlign: TextAlign.center,
          ),
          // color: ExpenseTrackerColors.violet,
        ),
        title: Text(
          categoryLocalData2
              .firstWhere(
                (element) => element.id == cardOfExpense.title,
              )
              .title,
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
          cardOfExpense.subtitle,
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
              '${cardOfExpense.amount < 0 ? "-" : "+"}\$${cardOfExpense.amount}',
              style: ExpenseTrackerTextStyle.body3.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: cardOfExpense.amount < 0
                    ? ExpenseTrackerColors.red
                    : ExpenseTrackerColors.green,
              ),
            ),
            // date
            Text(
              cardOfExpense.date,
              style: ExpenseTrackerTextStyle.small.copyWith(
                color: ExpenseTrackerColors.light20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
