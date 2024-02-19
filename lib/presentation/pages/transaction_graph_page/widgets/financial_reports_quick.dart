import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/quick_reports_view.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
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
      appBar: AppBar(
        backgroundColor: pages[page].color,
      ),
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
