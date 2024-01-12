import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class FinancialReportsQuick extends StatefulWidget {
  const FinancialReportsQuick({super.key});

  @override
  State<FinancialReportsQuick> createState() => _FinancialReportsQuickState();
}

class _FinancialReportsQuickState extends State<FinancialReportsQuick> {
  late LiquidController liquidController;
  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LiquidSwipe(
        waveType: WaveType.circularReveal,
        pages: const [
          QuickReportsView(
            title: 'This Month',
            amount: 233,
            color: ExpenseTrackerColors.red,
            type: QuickReportType.expense,
          ),
          QuickReportsView(
            title: 'This Month',
            amount: 233,
            color: ExpenseTrackerColors.green,
            type: QuickReportType.income,
          ),
          QuickReportsView(
            title: 'This Month',
            amount: 233,
            color: ExpenseTrackerColors.violet,
            type: QuickReportType.transfer,
          ),
        ],
      ),
    );
  }
}

enum QuickReportType {
  income,
  expense,
  transfer,
}

class QuickReportsView extends StatelessWidget {
  const QuickReportsView({
    required this.title,
    required this.type,
    required this.color,
    required this.amount,
    super.key,
  });
  final String title;
  final QuickReportType type;
  final Color color;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: ExpenseTrackerTextStyle.title2.copyWith(
              color: ExpenseTrackerColors.light.withOpacity(0.7),
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: type == QuickReportType.expense
                  ? 'You Spend 💸'
                  : type == QuickReportType.income
                      ? 'You Earn 💰'
                      : 'You Transfer 💸',
              style: ExpenseTrackerTextStyle.title1.copyWith(
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
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: ExpenseTrackerColors.light,
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Column(
              children: [
                Text(
                  'and your biggest expend is from',
                  style: ExpenseTrackerTextStyle.title2.copyWith(
                    color: ExpenseTrackerColors.dark,
                    fontWeight: FontWeight.w500,
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
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
                          categoryLocalData2.first.icon,
                          style: ExpenseTrackerTextStyle.title3.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ExpenseTrackerColors.violet,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        // color: ExpenseTrackerColors.violet,
                      ),
                      Text(categoryLocalData2.first.title),
                    ],
                  ),
                ),
                const Text(r'$1000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
