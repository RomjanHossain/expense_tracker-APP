import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/expenseform/expenseform.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/bloc.dart';
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
                          fillColor: ExpenseTrackerColors.white,
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
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.filter_list,
                        // color: ExpenseTrackerColors.violet,
                      ),
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'add',
                          child: Text('Add Subscription'),
                        ),
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit Subscription'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete Subscription'),
                        ),
                      ],
                      onSelected: (value) {
                        // if (value == 'add') {
                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (context) => ExpenseForm(),
                        //     ),
                        //   );
                        // }
                      },
                    )
                  ],
                ),
              ),
              Container(
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
                  border: Border.all(
                    color: ExpenseTrackerColors.violet,
                    // width: 1,
                  ),
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
                  // return Container(
                  //   child: Row(
                  //     children: [
                  //       // icon
                  //       Container(
                  //         height: 40.h,
                  //         width: 40.w,
                  //         decoration: BoxDecoration(
                  //           color: ExpenseTrackerColors.violet20,
                  //           borderRadius: BorderRadius.circular(10).r,
                  //         ),
                  //         child: const Icon(
                  //           Icons.shopping_bag,
                  //           color: ExpenseTrackerColors.violet,
                  //         ),
                  //       ),
                  //       Column(
                  //         children: [
                  //           // title
                  //           Text(
                  //             'Shopping',
                  //             style: ExpenseTrackerTextStyle.regular2.copyWith(
                  //               fontWeight: FontWeight.w600,
                  //               letterSpacing: 0.5,
                  //             ),
                  //           ),
                  //           // subtitle
                  //           Text(
                  //             'Shopping',
                  //             style: ExpenseTrackerTextStyle.small.copyWith(
                  //               color: ExpenseTrackerColors.light20,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       // +ve or -ve amount and date
                  //       Column(
                  //         children: [
                  //           // amount
                  //           Text(
                  //             '-\$100',
                  //             style: ExpenseTrackerTextStyle.regular2.copyWith(
                  //               fontWeight: FontWeight.w600,
                  //               letterSpacing: 0.5,
                  //             ),
                  //           ),
                  //           // date
                  //           Text(
                  //             'Today',
                  //             style: ExpenseTrackerTextStyle.small.copyWith(
                  //               color: ExpenseTrackerColors.light20,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // );
                  return Card(
                    elevation: 0,
                    child: ListTile(
                      leading: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: ExpenseTrackerColors.violet20,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: const Icon(
                          Icons.shopping_bag,
                          color: ExpenseTrackerColors.violet,
                        ),
                      ),
                      title: Text(
                        'Shopping',
                        style: ExpenseTrackerTextStyle.regular2.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                      subtitle: Text(
                        'Shopping',
                        style: ExpenseTrackerTextStyle.small.copyWith(
                          color: ExpenseTrackerColors.light20,
                        ),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // amount
                          Text(
                            '-\$100',
                            style: ExpenseTrackerTextStyle.regular3.copyWith(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          // date
                          Text(
                            'Today',
                            style: ExpenseTrackerTextStyle.small.copyWith(
                              color: ExpenseTrackerColors.light20,
                            ),
                          ),
                        ],
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
