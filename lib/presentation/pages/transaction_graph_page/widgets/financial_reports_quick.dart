import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/quick_reports_view.dart';
import 'package:expense_tracker/presentation/widgets/iemodel/data_from_i_emodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class FinancialReportsQuick extends StatefulWidget {
  const FinancialReportsQuick({
    required this.spendAmount,
    required this.incomeAmount,
    required this.transferAmount,
    required this.inc,
    required this.exp,
    required this.trans,
    super.key,
  });
  final IEmodel? inc;
  final IEmodel? exp;
  final IEmodel? trans;

  final int spendAmount;
  final int incomeAmount;
  final int transferAmount;

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

  int page = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String icon() {
      if (page == 0) {
        if (widget.exp == null) {
          return '';
        }
        return DataFromIEmodel.instance.getIcon(
          widget.exp!,
        );
      } else if (page == 1) {
        if (widget.inc == null) {
          return '';
        }
        return DataFromIEmodel.instance.getIcon(
          widget.inc!,
        );
      } else {
        if (widget.trans == null) {
          return '';
        }
        return DataFromIEmodel.instance.getIcon(
          widget.trans!,
        );
      }
    }

    String title() {
      if (page == 0) {
        if (widget.exp == null) {
          return '';
        }
        return DataFromIEmodel.instance.getTitle(
          widget.exp!,
        );
      } else if (page == 1) {
        if (widget.inc == null) {
          return '';
        }
        return DataFromIEmodel.instance.getTitle(
          widget.inc!,
        );
      } else {
        if (widget.trans == null) {
          return '';
        }
        return DataFromIEmodel.instance.getTitle(
          widget.trans!,
        );
      }
    }

    double amount() {
      if (page == 0) {
        if (widget.exp == null) {
          return 0;
        }
        return DataFromIEmodel.instance.getAmmount(
          widget.exp!,
        );
      } else if (page == 1) {
        if (widget.inc == null) {
          return 0;
        }
        return DataFromIEmodel.instance.getAmmount(
          widget.inc!,
        );
      } else {
        if (widget.trans == null) {
          return 0;
        }
        return DataFromIEmodel.instance.getAmmount(
          widget.trans!,
        );
      }
    }

    final pages = [
      QuickReportsView(
        title: 'This Month',
        amount: widget.spendAmount,
        color: ExpenseTrackerColors.red,
        page: 0,
        type: ExpenseType.expense,
        cardIcon: icon(),
        cardTitle: title(),
        cardAmount: amount().toInt(),
      ),
      QuickReportsView(
        cardIcon: icon(),
        cardTitle: title(),
        cardAmount: amount().toInt(),
        title: 'This Month',
        amount: widget.incomeAmount,
        color: ExpenseTrackerColors.green,
        page: 1,
        type: ExpenseType.income,
      ),
      QuickReportsView(
        page: 2,
        title: 'This Month',
        cardIcon: icon(),
        cardTitle: title(),
        cardAmount: amount().toInt(),
        amount: widget.transferAmount,
        color: ExpenseTrackerColors.violet,
        type: ExpenseType.transfer,
      ),
    ];
    return Scaffold(
      backgroundColor: pages[page].color,
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
