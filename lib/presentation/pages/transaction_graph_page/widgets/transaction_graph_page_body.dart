import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/transaction_card_list.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/transaction_filter_sheet.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/widgets/financial_reports_quick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionGraphPageBody extends StatelessWidget {
  const TransactionGraphPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionGraphPageBloc, TransactionGraphPageState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 40.h,
              child: Row(
                children: [
                  // spacer
                  const Spacer(),
                  //NOTE: a popup menu button to show the list of subscriptions
                  IconButton.filled(
                    onPressed: () async {
                      // a bottom sheet to
                      await showModalBottomSheet<void>(
                        isScrollControlled: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        context: context,
                        builder: (context) {
                          return const TransactionFilterSheet();
                        },
                      );
                    },
                    style: ButtonStyle(
                      // ractangular shape
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                      ),
                      // border
                      side: WidgetStateProperty.all(
                        const BorderSide(
                          color: ExpenseTrackerColors.light60,
                        ),
                      ),
                      // backgorund color to trans
                      backgroundColor:
                          WidgetStateProperty.all(Colors.transparent),
                    ),
                    icon: Icon(
                      Icons.filter_list,
                      color: !isDarkMode(context)
                          ? ExpenseTrackerColors.dark50
                          : ExpenseTrackerColors.light40,
                    ),
                  ),
                ],
              ),
            ),
            //NOTE: goto financial reports
            OpenContainer(
              closedBuilder: (context, action) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(
                    // horizontal: 10,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: ExpenseTrackerColors.violet20,
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'See your financial reports',
                        style: ExpenseTrackerTextStyle.small.copyWith(
                          color: ExpenseTrackerColors.violet,
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next,
                        color: ExpenseTrackerColors.violet,
                      ),
                    ],
                  ),
                );
              },
              openElevation: 0,
              closedElevation: 0,
              closedColor: Colors.transparent,
              openBuilder: (context, action) {
                final today = DateTime.now();
                IEmodel? xpn;
                IEmodel? inc;
                IEmodel? trn;
                // get total ammounts
                final spendAmount = state.yearlyIEmodel
                    .where(
                  (e) =>
                      e.isIncome == ExpenseType.expense &&
                      e.expense?.createdDate?.month == today.month &&
                      e.expense?.createdDate?.year == today.year,
                )
                    .fold<double>(
                  0,
                  (previousValue, IEmodel element) {
                    xpn ??= element;
                    xpn = xpn!.expense!.amount > element.expense!.amount
                        ? xpn
                        : element;
                    return previousValue + element.expense!.amount;
                  },
                );

                final incomeAmount = state.yearlyIEmodel
                    .where(
                  (e) =>
                      e.isIncome == ExpenseType.income &&
                      e.income?.createdDate?.month == today.month &&
                      e.income?.createdDate?.year == today.year,
                )
                    .fold<double>(
                  0,
                  (previousValue, IEmodel element) {
                    inc ??= element;
                    inc = inc!.income!.amount > element.income!.amount
                        ? inc
                        : element;
                    return previousValue + element.income!.amount;
                  },
                );

                final transferAmount = state.yearlyIEmodel
                    .where(
                  (e) =>
                      e.isIncome == ExpenseType.transfer &&
                      e.transfer?.createdDate?.month == today.month &&
                      e.transfer?.createdDate?.year == today.year,
                )
                    .fold<double>(
                  0,
                  (previousValue, IEmodel element) {
                    trn ??= element;
                    trn = trn!.transfer!.amount > element.transfer!.amount
                        ? trn
                        : element;
                    return previousValue + element.income!.amount;
                  },
                );
                return FinancialReportsQuick(
                  spendAmount: spendAmount.toInt(),
                  incomeAmount: incomeAmount.toInt(),
                  transferAmount: transferAmount.toInt(),
                  inc: inc,
                  exp: xpn,
                  trans: trn,
                );
              },
            ),

            //INFO: months
            if (state.yearlyIEmodel.isNotEmpty) ...[
              TransactionCardList(
                allIEmodel: state.yearlyIEmodel,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
