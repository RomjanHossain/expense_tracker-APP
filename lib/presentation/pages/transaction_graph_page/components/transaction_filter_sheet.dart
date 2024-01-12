import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionFilterSheet extends StatefulWidget {
  const TransactionFilterSheet({
    super.key,
  });

  @override
  State<TransactionFilterSheet> createState() => _TransactionFilterSheetState();
}

class _TransactionFilterSheetState extends State<TransactionFilterSheet> {
  final bottomTitle = ExpenseTrackerTextStyle.body3.copyWith(
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.8,
      margin: EdgeInsets.only(
        top: 10.h,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //! reset transaction filters
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Transactions',
                  style: bottomTitle,
                ),
                FilledButton.tonal(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      ExpenseTrackerColors.violet20,
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide.none,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: ExpenseTrackerTextStyle.body3.copyWith(
                      color: ExpenseTrackerColors.violet,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //! Filter by (income/expense/transfer)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Filter',
              style: bottomTitle,
            ),
          ),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final i in [
                'Income',
                'Expense',
                'Transfer',
              ])
                FilterChip(
                  // border color
                  side: const BorderSide(
                    color: ExpenseTrackerColors.light60,
                  ),
                  // round shape
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15 + 5).r,
                  ),
                  label: Text(i),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  showCheckmark: false,
                  tooltip: i,
                  backgroundColor: ExpenseTrackerColors.light,
                  // selected: true,
                  onSelected: (bool value) {},
                ),
            ],
          ),
          //! Filter by (category)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Sort by',
              style: bottomTitle,
            ),
          ),
          Wrap(
            children: [
              for (final i in ['Highest', 'Lowest', 'Newest', 'oldest'])
                Padding(
                  padding: EdgeInsets.only(
                    right: 3.w,
                    bottom: 3.h,
                  ),
                  child: FilterChip(
                    // border color
                    side: const BorderSide(
                      color: ExpenseTrackerColors.light60,
                    ),
                    // round shape
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15 + 5).r,
                    ),
                    label: Text(i),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    showCheckmark: false,
                    tooltip: i,
                    backgroundColor: ExpenseTrackerColors.light,
                    // selected: true,
                    onSelected: (bool value) {},
                  ),
                ),
            ],
          ),
          //! Category
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Category',
              style: bottomTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Choose Category'),
                GestureDetector(
                  onTap: () async {
                    // show bottom sheet of categories (categoryLocalData2)
                    await showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        // return const ExpenseForm();
                        // return const TransactionFilterSheet();
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Choose Category',
                                  style: bottomTitle,
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: categoryLocalData2.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Text(
                                        categoryLocalData2[index].icon,
                                        // color: categoryLocalData2[index].color,
                                      ),
                                      title: Text(
                                        categoryLocalData2[index].title,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Row(
                    children: [
                      Text('0 Selected'),
                      Icon(
                        Icons.navigate_next,
                        color: ExpenseTrackerColors.violet,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // apply button
          PrimaryButton(onPress: () {}, text: 'Apply')
        ],
      ),
    );
  }
}
