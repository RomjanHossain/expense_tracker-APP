import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/widgets/iemodel/data_from_i_emodel.dart';
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
    final icon = DataFromIEmodel.instance.getIcon(cardOfExpense);
    final title = DataFromIEmodel.instance.getTitle(cardOfExpense);
    final description = DataFromIEmodel.instance.getDescription(cardOfExpense);
    final amount = DataFromIEmodel.instance.getAmmount(cardOfExpense);
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
            color: generatingRandomColor().withValues(alpha: 0.2),
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
              DataFromIEmodel.instance.getDate(cardOfExpense),
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
