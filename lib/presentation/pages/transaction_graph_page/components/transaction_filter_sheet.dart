import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/transaction_graph_page_bloc.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/utils_.dart';
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
    return BlocConsumer<TransactionGraphPageBloc, TransactionGraphPageState>(
      builder: (context, state) {
        return Container(
          // height: MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.only(
            top: 10.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //! reset transaction filters
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter Transactions',
                      style: bottomTitle.copyWith(
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light40
                            : ExpenseTrackerColors.dark25,
                      ),
                    ),
                    // WARNING: reset btn
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
              //!NOTE: Filter by (income/expense/transfer)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Filter',
                  style: bottomTitle.copyWith(
                    color: isDarkMode(context)
                        ? ExpenseTrackerColors.light40
                        : ExpenseTrackerColors.dark25,
                  ),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (final i in ExpenseType.values)
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: FilterChip(
                        padding: const EdgeInsets.all(5).r,
                        label: Text(i.name),
                        labelStyle: ExpenseTrackerTextStyle.small.copyWith(
                          color: state.expenseType == i
                              ? ExpenseTrackerColors.violet
                              : isDarkMode(context)
                                  ? ExpenseTrackerColors.light40
                                  : ExpenseTrackerColors.dark25,
                        ),
                        tooltip: i.name,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        selected: state.expenseType == i,
                        onSelected: (bool value) {
                          context
                              .read<TransactionGraphPageBloc>()
                              .add(ChangeExpenseTypeEvent(expenseType: i));
                        },
                      ),
                    ),
                ],
              ),
              //! Filter by (category)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Sort by',
                  style: bottomTitle.copyWith(
                    color: isDarkMode(context)
                        ? ExpenseTrackerColors.light40
                        : ExpenseTrackerColors.dark25,
                  ),
                ),
              ),
              Wrap(
                children: [
                  for (final i in SortType.values)
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: FilterChip(
                        label: Text(i.name),
                        padding: const EdgeInsets.all(5).r,
                        labelStyle: ExpenseTrackerTextStyle.small.copyWith(
                          color: state.sortType == i
                              ? ExpenseTrackerColors.violet
                              : isDarkMode(context)
                                  ? ExpenseTrackerColors.light40
                                  : ExpenseTrackerColors.dark25,
                        ),
                        tooltip: i.name,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        selected: state.sortType == i,
                        onSelected: (bool value) {
                          context
                              .read<TransactionGraphPageBloc>()
                              .add(ChangeSortTypeEvent(sortType: i));
                        },
                      ),
                    ),
                ],
              ),
              Text("hello ${state.categorySelected.length}"),
              //!NOTE: Category
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Category',
                  style: bottomTitle.copyWith(
                    color: isDarkMode(context)
                        ? ExpenseTrackerColors.light40
                        : ExpenseTrackerColors.dark25,
                  ),
                ),
              ),
              const SelectCateogries(),
              SizedBox(
                height: 10.h,
              ),
              // apply button
              ElevatedButton(onPressed: () {}, child: const Text('Apply')),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class SelectCateogries extends StatelessWidget {
  const SelectCateogries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<TransactionGraphPageBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Choose Category'),
          GestureDetector(
            onTap: () async {
              //NOTE: show bottom sheet of categories (categoryLocalData2)
              await showModalBottomSheet<void>(
                isScrollControlled: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                context: context,
                builder: (context) => ChooseCategorySheet(
                  categorySelected: state.categorySelected,
                ),
              );
            },
            child: HowManySelected(),
          ),
        ],
      ),
    );
  }
}

class HowManySelected extends StatefulWidget {
  const HowManySelected({
    super.key,
  });

  @override
  State<HowManySelected> createState() => _HowManySelectedState();
}

class _HowManySelectedState extends State<HowManySelected> {
  int selected = 0;

  // final selectedL =
  //     context.watch<TransactionGraphPageBloc>().state.categorySelected.length;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final x =
    //     context.watch<TransactionGraphPageBloc>().state.categorySelected.length;
    // if (x != selected) {
    //   setState(() {});
    // }
    return BlocConsumer<TransactionGraphPageBloc, TransactionGraphPageState>(
      listener: (BuildContext context, TransactionGraphPageState state) {
        debugPrint(
            "current stae lenght form selectedText : ${state.categorySelected.length}");
        if (state.categorySelected.length != selected) {
          selected = state.categorySelected.length;
          setState(() {});
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Text('$selected Selected'),
            IconButton(
                onPressed: () {
                  selected += 1;
                  setState(() {});
                },
                icon: Icon(Icons.add)),
            const Icon(
              Icons.navigate_next,
              color: ExpenseTrackerColors.violet,
            ),
          ],
        );
      },
    );
    // return Row(
    //   children: [
    //     Text('$selected Selected'),
    //     const Icon(
    //       Icons.navigate_next,
    //       color: ExpenseTrackerColors.violet,
    //     ),
    //   ],
    // );
  }
}

class ChooseCategorySheet extends StatefulWidget {
  const ChooseCategorySheet({
    super.key,
    this.categorySelected,
  });

  final List<CategoryModel>? categorySelected;
  @override
  State<ChooseCategorySheet> createState() => _ChooseCategorySheetState();
}

class _ChooseCategorySheetState extends State<ChooseCategorySheet> {
  final bottomTitle = ExpenseTrackerTextStyle.body3.copyWith(
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );
  @override
  void initState() {
    if (widget.categorySelected != null) {
      categorySelected.addAll(widget.categorySelected!);
    }
    super.initState();
  }

  final List<CategoryModel> categorySelected = [];
  @override
  Widget build(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Choose Category',
                style: bottomTitle.copyWith(
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light40
                      : ExpenseTrackerColors.dark25,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categoryLocalData2.length,
                itemBuilder: (context, index) {
                  final currentCategory = categoryLocalData2[index];
                  return ListTile(
                    selected: categorySelected.contains(
                      currentCategory,
                    ),
                    leading: Text(
                      currentCategory.icon,
                    ),
                    title: Text(
                      currentCategory.title,
                    ),
                    onTap: () {
                      context.read<TransactionGraphPageBloc>().add(
                            ChangeCategoryEvent(
                              category: categoryLocalData2[index],
                            ),
                          );
                      if (categorySelected.contains(currentCategory)) {
                        categorySelected.remove(currentCategory);
                      } else {
                        categorySelected.add(currentCategory);
                      }
                      setState(() {});

                      // Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
}
