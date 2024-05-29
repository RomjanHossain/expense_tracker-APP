import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/quick_reports_view.dart';
import 'package:expense_tracker/core/utils/utils.dart';

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
      page: 0,
      type: ExpenseType.expense,
    ),
    QuickReportsView(
      title: 'This Month',
      amount: 233,
      color: ExpenseTrackerColors.green,
      page: 1,
      type: ExpenseType.income,
    ),
    QuickReportsView(
      page: 2,
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
      // appBar: AppBar(
      //   backgroundColor: pages[page].color,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          Expanded(
            child: LiquidSwipe(
              enableSideReveal: true,
              onPageChangeCallback: (page) {
                // liquidController.animateToPage(page: page);
                setState(() {
                  this.page = page;
                });
              },
              // waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              pages: pages,
              enableLoop: false,
              fullTransitionValue: 500,
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.navigate_before),
            ),
          ),
        ],
      ),
    );
  }
}
