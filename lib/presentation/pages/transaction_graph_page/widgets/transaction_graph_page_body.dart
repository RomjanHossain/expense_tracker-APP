import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/view/expensedetails_page.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expenses.dart';
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
                  //NOTE: show dropdown of subscriptionsFrequency
                  // Expanded(
                  //   child: DropdownButtonFormField(
                  //     isExpanded: true,
                  //     dropdownColor: ExpenseTrackerColors.violet,
                  //     focusColor: isDarkMode(context)
                  //         ? ExpenseTrackerColors.dark75
                  //         : ExpenseTrackerColors.light,
                  //     decoration: dropdownInputDecoration('Frequency'),
                  //     items: SubscriptionsFrequency.values
                  //         .map(
                  //           (e) => DropdownMenuItem(
                  //             value: e,
                  //             child: Text(getSucriptionFrequencyText(e)),
                  //           ),
                  //         )
                  //         .toList(),
                  //     onChanged: (value) {},
                  //   ),
                  // ),
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
                return const FinancialReportsQuick();
              },
            ),
            //INFO: today
            Text(
              'Today',
              style: ExpenseTrackerTextStyle.title3.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: !isDarkMode(context)
                    ? ExpenseTrackerColors.dark
                    : ExpenseTrackerColors.light,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.todaysIEmodel.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final currentItem = state.todaysIEmodel.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      ExpensedetailsPage.route(currentItem),
                    );
                  },
                  child: CardOfExpense2(
                    cardOfExpense: currentItem,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
