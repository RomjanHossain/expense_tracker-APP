import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/transaction_graph_page.dart';
import 'package:flutter/material.dart';

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
