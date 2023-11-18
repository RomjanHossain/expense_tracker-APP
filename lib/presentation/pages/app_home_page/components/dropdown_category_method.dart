import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_category_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:flutter/material.dart';

class CategoryMehodsDropdown extends StatelessWidget {
  const CategoryMehodsDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCategoryMethodCubit, int>(
      builder: (context, state) {
        return DropdownButton<CategoryModel>(
          borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
          underline: Container(),
          isExpanded: true, //Adding this property, does the magic
          dropdownColor: Colors.blueGrey[300],
          icon: const Icon(Icons.keyboard_arrow_down),
          // value: CategoryModel(title: 'Housing', icon: Icons.house),
          // padding: const EdgeInsets.all(0),
          value: ExpenseTrackerCategories.singleExpenseCategory(state),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          items: ExpenseTrackerCategories.expenseCategoriesMethod
              .map(
                (e) => DropdownMenuItem<CategoryModel>(
                  value: e,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(e.icon),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            e.title.trim(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: ExpenseTrackerTextStyle.caption,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (s) {
            debugPrint('Selected ${s!.title.trim()} ${s.id}}');
            context.read<DropdownCategoryMethodCubit>().changeIndex(s.id);
          },
        );
      },
    );
  }
}
