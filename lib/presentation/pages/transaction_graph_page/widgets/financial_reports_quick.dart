import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/presentation/pages/expensereport/view/expensereport_page.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
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

  final pages = const [
    QuickReportsView(
      title: 'This Month',
      amount: 233,
      color: ExpenseTrackerColors.red,
      type: ExpenseType.expense,
    ),
    QuickReportsView(
      title: 'This Month',
      amount: 233,
      color: ExpenseTrackerColors.green,
      type: ExpenseType.income,
    ),
    QuickReportsView(
      title: 'This Month',
      amount: 233,
      color: ExpenseTrackerColors.violet,
      type: ExpenseType.transfer,
    ),
  ];
  int page = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pages[page].color,
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              for (final x in List.generate(3, (index) => index))
                Expanded(
                  child: InkWell(
                    onTap: () {
                      liquidController.animateToPage(
                        page: x,
                        // duration: const Duration(milliseconds: 500),
                      );
                      // setState(() {});
                    },
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: x == page
                            ? ExpenseTrackerColors.light
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
                )
            ],
          ),
          Expanded(
            child: LiquidSwipe(
              enableSideReveal: true,
              onPageChangeCallback: (page) {
                debugPrint('page chaged');
                // liquidController.animateToPage(page: page);
                setState(() {
                  this.page = page;
                });
              },
              waveType: WaveType.circularReveal,
              liquidController: liquidController,
              pages: pages,
            ),
          ),
        ],
      ),
    );
  }
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
  final ExpenseType type;
  final Color color;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                Text(
                  'and your biggest expend is from',
                  style: ExpenseTrackerTextStyle.title2.copyWith(
                    color: ExpenseTrackerColors.dark,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    height: 1.2,
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
                          categoryLocalData2.first.icon,
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
                        categoryLocalData2.first.title,
                        style: ExpenseTrackerTextStyle.body3.copyWith(
                          color: ExpenseTrackerColors.dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  r'$1000',
                  style: ExpenseTrackerTextStyle.title1.copyWith(
                    color: ExpenseTrackerColors.dark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          if (type == ExpenseType.transfer)
            Padding(
              padding: const EdgeInsets.all(8),
              child: SecondaryButton(
                onPress: () {
                  Navigator.push(context, ExpensereportPage.route());
                },
                text: 'See full details',
              ),
            ),
        ],
      ),
    );
  }
}
