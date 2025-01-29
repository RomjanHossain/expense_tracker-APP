import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/expensereport/view/expensereport_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickReportsView extends StatelessWidget {
  const QuickReportsView({
    required this.title,
    required this.type,
    required this.color,
    required this.amount,
    required this.page,
    required this.cardIcon,
    required this.cardTitle,
    required this.cardAmount,
    super.key,
  });
  final String title;
  final ExpenseType type;
  final Color color;
  final int amount;
  final int page;
  final String cardIcon;
  final String cardTitle;
  final int cardAmount;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            children: [
              for (final x in List.generate(3, (index) => index))
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // liquidController.animateToPage(
                      //   page: x,
                      //   // duration: const Duration(milliseconds: 500),
                      // );
                      // setState(() {});
                    },
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: x == page
                            ? isDarkMode(context)
                                ? ExpenseTrackerColors.dark
                                : ExpenseTrackerColors.light
                            : ExpenseTrackerColors.light.withOpacity(
                                0.3,
                              ),
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Text(
            title,
            style: ExpenseTrackerTextStyle.title3.copyWith(
              color: ExpenseTrackerColors.light.withOpacity(0.7),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: type == ExpenseType.expense
                  ? 'You Spend 💸'
                  : type == ExpenseType.income
                      ? 'You Earn 💰'
                      : 'You Transfer 💸',
              style: ExpenseTrackerTextStyle.title2.copyWith(
                color: ExpenseTrackerColors.light,
              ),
              children: [
                TextSpan(
                  text: '\n\$$amount',
                  style: ExpenseTrackerTextStyle.titleX.copyWith(
                    color: ExpenseTrackerColors.light,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // below box
          if (amount > 0)
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                // vertical: 20,
                left: 15, right: 15,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: ExpenseTrackerColors.light,
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'and your biggest',
                      style: ExpenseTrackerTextStyle.title2.copyWith(
                        color: ExpenseTrackerColors.dark,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        height: 1.2,
                      ),
                      children: [
                        if (type == ExpenseType.expense)
                          const TextSpan(
                            text: ' expend',
                          )
                        else if (type == ExpenseType.income)
                          const TextSpan(
                            text: ' income',
                          )
                        else
                          const TextSpan(
                            text: ' transfer',
                          ),
                        const TextSpan(
                          text: ' is from',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ExpenseTrackerColors.light,
                      borderRadius: BorderRadius.circular(20).r,
                      border: Border.all(
                        color: ExpenseTrackerColors.light40,
                      ),
                    ),
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: ExpenseTrackerColors.violet20,
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            cardIcon,
                            style: ExpenseTrackerTextStyle.title3.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ExpenseTrackerColors.violet,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // color: ExpenseTrackerColors.violet,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          cardTitle,
                          style: ExpenseTrackerTextStyle.body3.copyWith(
                            color: ExpenseTrackerColors.dark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$$cardAmount',
                    style: ExpenseTrackerTextStyle.title1.copyWith(
                      color: ExpenseTrackerColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          if (type == ExpenseType.transfer)
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: OutlinedButton(
            //     onPressed: () {
            //       Navigator.push(context, ExpensereportPage.route());
            //     },
            //     child: const Text('See full details'),
            //   ),
            // ),

            OpenContainer(
              closedBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: OutlinedButton(
                    onPressed: action,
                    child: const Text('See full details'),
                  ),
                );
              },
              openElevation: 0,
              closedColor: Colors.transparent,
              openColor: Colors.transparent,
              closedElevation: 0,
              openBuilder: (context, action) {
                return const ExpensereportPage();
              },
            ),
        ],
      ),
    );
  }
}
