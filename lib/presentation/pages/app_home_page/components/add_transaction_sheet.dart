import 'package:expense_tracker/app/ui/src/theme.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/widgets/buttons/input_btn.dart';
import 'package:expense_tracker/presentation/widgets/buttons/single_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  const AddTransactionBottomSheet({super.key});

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

        /// also show which category it belongs
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e.title),
                              )),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (s) {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
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

        /// Show the type [Expense] or [Income] or [Borrowed] or [Lent]
        Text(
          'Expenses',
          style: ExpenseTrackerTextStyle.subtitle1!.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.grey.shade400,
          ),
        ),

        /// User inputed amount
        Padding(
          padding: EdgeInsets.only(
            bottom: 30,
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Icon(
                  CupertinoIcons.money_dollar,
                  size: 35,
                  color: Colors.grey.shade400,
                ),
              ),
              Text(
                '254.22',
                style: ExpenseTrackerTextStyle.headline1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        /// User inputed description
        // Text(
        //   'Add comment...',
        //   style: ExpenseTrackerTextStyle.bodyText2!
        //       .copyWith(color: Colors.grey.shade400),
        // ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Add comment...',
            contentPadding: EdgeInsets.only(
                left: screenSize.width / 3, bottom: 11, top: 11, right: 15),
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
            color: Colors.indigo,
            child: Row(
              children: [
                ButtonRow([
                  Button(text: 'text', cb: (s) {}),
                  Button(text: 'text', cb: (s) {}),
                  Button(text: 'text', cb: (s) {}),
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
