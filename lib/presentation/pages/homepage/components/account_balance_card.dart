import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/ie_small_card.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountBalanceAndCardofIE extends StatelessWidget {
  const AccountBalanceAndCardofIE({
    required this.accountBalance,
    required this.income,
    required this.expense,
    super.key,
  });
  final double accountBalance;
  final double income;
  final double expense;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Account Balance',
          style: ExpenseTrackerTextStyle.body3.copyWith(
            color: isDarkMode(context)
                ? ExpenseTrackerColors.dark25
                : ExpenseTrackerColors.light20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
          child: Text(
            '\$$accountBalance',
            style: ExpenseTrackerTextStyle.title1.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        height10,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: width > 265
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 0.45.sw,
                      child: IESmallCard(
                        svgAsset: ExpenseAssets.incomeIcon,
                        color: ExpenseTrackerColors.green,
                        title: 'Income',
                        money: '$income',
                      ),
                    ),
                    width10,
                    SizedBox(
                      width: 0.45.sw,
                      child: IESmallCard(
                        svgAsset: ExpenseAssets.expenseIcon,
                        color: ExpenseTrackerColors.red,
                        title: 'Expense',
                        money: '$expense',
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      width: 0.5.sw,
                      child: IESmallCard(
                        svgAsset: ExpenseAssets.incomeIcon,
                        color: ExpenseTrackerColors.green,
                        title: 'Income',
                        money: '$income',
                      ),
                    ),
                    height10,
                    SizedBox(
                      width: 0.5.sw,
                      child: IESmallCard(
                        svgAsset: ExpenseAssets.expenseIcon,
                        color: ExpenseTrackerColors.red,
                        title: 'Expense',
                        money: '$expense',
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
