import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/isar_ins.dart';
import 'package:expense_tracker/data/repositories/expense_repo_impl.dart';
import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_category_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_category_method.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/dropdown_expense_method.dart';
import 'package:expense_tracker/presentation/widgets/buttons/input_btn.dart';
import 'package:expense_tracker/presentation/widgets/buttons/single_btn.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  AddTransactionBottomSheet({super.key});

  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      // create: (context) => SubjectBloc(),
      providers: [
        BlocProvider(
          create: (context) => DropdownExpenseMethodCubit(),
        ),
        BlocProvider(
          create: (context) => DropdownCategoryMethodCubit(),
        ),
      ],
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Show Cash or Card or Bank or Mobile Banking or Crypto
          const SizedBox(
            height: 20,
          ),

          ///* also show which category it belongs
          const Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ExpenseMethodsDropdown(),
                ),

                SizedBox(
                  width: 10,
                ),

                ///* also show which category it belongs
                Expanded(
                  child: CategoryMehodsDropdown(),
                ),
              ],
            ),
          ),

          ///* Show the type [Expense] or [Income] or [Borrowed] or [Lent]
          Text(
            'Expenses',
            style: ExpenseTrackerTextStyle.subtitle1.copyWith(
              fontWeight: FontWeight.w300,
              color: Colors.grey.shade400,
            ),
          ),

          /// User inputed amount
          BlocBuilder<ExpenseTextControllerCubit, String>(
            builder: (context, state) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          CupertinoIcons.money_dollar,
                          size: 35,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        state,
                        style: ExpenseTrackerTextStyle.headline1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Add comment...',
              contentPadding: EdgeInsets.only(
                left: screenSize.width / 3,
                bottom: 11,
                top: 11,
                right: 15,
              ),
              hintStyle: ExpenseTrackerTextStyle.bodyText2.copyWith(
                color: Colors.grey.shade400,
              ),
              border: InputBorder.none,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              // height: screenSize.height / 1.5,
              // color: Colors.indigo,
              child: Row(
                children: [
                  ButtonRow([
                    Button(
                      text: '1',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '4',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '7',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: r'$',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                  ]),
                  ButtonRow([
                    Button(
                      text: '2',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '5',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '8',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '0',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                  ]),
                  ButtonRow([
                    Button(
                      text: '3',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '6',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '9',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                    Button(
                      text: '.',
                      cb: (s) {
                        context.read<ExpenseTextControllerCubit>().addText(s);
                      },
                    ),
                  ]),
                  ButtonRow([
                    Button(
                      text: '❌',
                      cb: (s) {
                        final ammountState =
                            context.read<ExpenseTextControllerCubit>().state;
                        if (ammountState == '0.00') {
                          return;
                        }
                        context.read<ExpenseTextControllerCubit>().removeText();
                      },
                    ),
                    Button(
                      text: '🗓️',
                      cb: (s) => _selectDate(context),
                    ),
                    Button(
                      text: '✓',
                      cb: (s) {
                        if (double.parse(context
                                .read<ExpenseTextControllerCubit>()
                                .state) <
                            1) {
                          return;
                        }
                        // show a dialog to confirm
                        // if yes then add the transaction
                        // if no then do nothing
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: const EdgeInsets.all(8),
                            insetPadding: const EdgeInsets.all(8),
                            title: const Text('Confirm'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Are you sure you want to add this transaction?',
                                ),
                                Text(
                                  'Amount: ${context.read<ExpenseTextControllerCubit>().state}',
                                ),
                                Text(
                                    'Method: ${context.read<DropdownExpenseMethodCubit>().state}'),
                                Text(
                                    'Category: ${context.read<DropdownCategoryMethodCubit>().state}'),
                                Text('Comment: ${commentController.text}'),
                                // Text("Date: ${currentDate.toString()}")
                                // format the date to a readable format
                                Text(
                                  'Date: ${DateFormat.yMd().format(currentDate)}',
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // Text(
                                  //   'Amount: ${context.read<ExpenseTextControllerCubit>().state}',
                                  // ),
                                  // Text(
                                  //     'Method: ${context.read<DropdownExpenseMethodCubit>().state}'),
                                  // Text(
                                  //     'Category: ${context.read<DropdownCategoryMethodCubit>().state}'),
                                  // Text('Comment: ${commentController.text}'),
                                  // // Text("Date: ${currentDate.toString()}")
                                  // // format the date to a readable format
                                  // Text(
                                  //   'Date: ${DateFormat.yMd().format(currentDate)}',
                                  // ),
                                  final data = ExpenseEntity(
                                      incomeSource: context
                                          .read<DropdownCategoryMethodCubit>()
                                          .state,
                                      // spentedON: context.read<DropdownExpenseMethodCubit>().state,
                                      spentedON: ExpenseTrackerCategories
                                              .categoryExpenseMethods
                                              .elementAtOrNull(context
                                                  .read<
                                                      DropdownExpenseMethodCubit>()
                                                  .state)
                                              ?.title ??
                                          "",
                                      money: double.parse(
                                        context
                                            .read<ExpenseTextControllerCubit>()
                                            .state,
                                      ),
                                      whenItWasSpent: DateTime.now());
                                  final db = await IsarService().database;

                                  final iml = ExpenseRepoImpl(db);
                                  iml.createExpenseRecord(data);

                                  context
                                      .read<ExpenseTextControllerCubit>()
                                      .clearText();
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                      big: true,
                      color: Colors.black,
                    ),
                  ]),
                ],
              ),
            ),
          ),

          /// Calculator like number buttons
        ],
      ),
    );
  }

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
  }
}
