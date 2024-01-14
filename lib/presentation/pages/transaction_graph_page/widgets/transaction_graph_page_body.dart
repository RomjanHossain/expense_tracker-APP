import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/domain/entities/card_of_expense/card_of_expense_entity.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/view/expensedetails_page.dart';
import 'package:expense_tracker/presentation/pages/expenseform/expenseform.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expense.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/transaction_filter_sheet.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/widgets/financial_reports_quick.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template transaction_graph_page_body}
/// Body of the TransactionGraphPagePage.
///
/// Add what it does
/// {@endtemplate}
class TransactionGraphPageBody extends StatelessWidget {
  /// {@macro transaction_graph_page_body}
  const TransactionGraphPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionGraphPageBloc, TransactionGraphPageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    // show dropdown of subscriptionsFrequency
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration:
                            dropdownInputDecoration('Frequency').copyWith(
                          fillColor: ExpenseTrackerColors.light,
                        ),
                        items: subscriptionsFrequency
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    // spacer
                    const Spacer(),
                    // a popup menu button to show the list of subscriptions
                    Badge(
                      label: const Text(
                        '3',
                      ),
                      backgroundColor: ExpenseTrackerColors.violet,
                      isLabelVisible: true,
                      // alignment: Alignment.center,
                      largeSize: 20.r,
                      child: IconButton.filled(
                        onPressed: () async {
                          // a bottom sheet to
                          await showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              // return const ExpenseForm();
                              return const TransactionFilterSheet();
                            },
                          );
                        },
                        style: ButtonStyle(
                          // ractangular shape
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                          ),
                          // border
                          side: MaterialStateProperty.all(
                            const BorderSide(
                              color: ExpenseTrackerColors.light60,
                            ),
                          ),
                          // backgorund color to trans
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        icon: const Icon(
                          Icons.filter_list,
                          color: ExpenseTrackerColors.dark50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  //! financial reports
                  Navigator.push(
                    context,
                    PageAnimation.fadeThroughTransitionPageWrapper(
                      const FinancialReportsQuick(),
                    ),
                  );
                },
                child: Container(
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
                    // border: Border.all(
                    //   color: ExpenseTrackerColors.violet,
                    //   // width: 1,
                    // ),
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
                ),
              ),
              // today
              Text(
                'Today',
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        ExpensedetailsPage.route(ExpenseTrackerColors.red),
                      );
                    },
                    child: const CardOfExpense(
                      cardOfExpense: CardOfExpenseEntity(
                        color: ExpenseTrackerColors.violet,
                        title: 'householdRepairs',
                        subtitle: 'Walmart',
                        amount: 23,
                        date: 'Today',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
