import 'package:expense_tracker/app/ui/src/theme.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/widgets/buttons/input_btn.dart';
import 'package:expense_tracker/presentation/widgets/buttons/single_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  AddTransactionBottomSheet({super.key});

  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Show Cash or Card or Bank or Mobile Banking or Crypto
        const SizedBox(
          height: 20,
        ),

        ///* also show which category it belongs
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: DropdownButton<CategoryModel>(
                  borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
                  underline: Container(),
                  dropdownColor: Colors.blueGrey,
                  // hint: const Text('Cash'),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.all(0),
                  items: ExpenseTrackerCategories.categoryExpenseMethods
                      .map(
                        (e) => DropdownMenuItem<CategoryModel>(
                          value: e,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(e.icon),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(e.title),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (s) {
                    debugPrint('Selected ${s!.title}');
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              ///* also show which category it belongs
              Expanded(
                child: DropdownButton<CategoryModel>(
                  borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
                  underline: Container(),
                  dropdownColor: Colors.blueGrey,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // padding: const EdgeInsets.all(0),
                  items: ExpenseTrackerCategories.expenseCategoriesMethod
                      .map(
                        (e) => DropdownMenuItem<CategoryModel>(
                          value: e,
                          child: Row(
                            children: [
                              Icon(e.icon),
                              Text(
                                e.title,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (s) {},
                ),
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

        /// User inputed description
        // Text(
        //   'Add comment...',
        //   style: ExpenseTrackerTextStyle.bodyText2!
        //       .copyWith(color: Colors.grey.shade400),
        // ),
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
                      context.read<ExpenseTextControllerCubit>().removeText();
                    },
                  ),
                  Button(text: '🗓️', cb: (s) {}),
                  Button(
                    text: '✓',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().clearText();
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
    );
  }
}
