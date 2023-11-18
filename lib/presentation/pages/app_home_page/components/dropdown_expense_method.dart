import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/theme.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:flutter/material.dart';

class ExpenseMethodsDropdown extends StatelessWidget {
  const ExpenseMethodsDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownExpenseMethodCubit, int>(
      builder: (context, state) {
        return DropdownButton<CategoryModel>(
          borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
          underline: Container(),
          isExpanded: true, //Adding this property, does the magic
          // hint: const Text('Cash'),
          icon: const Icon(Icons.keyboard_arrow_down),
          alignment: Alignment.center,
          // focusColor: Colors.purple, // after selecting a value
          dropdownColor: Colors.blueGrey[300], // Dropdown open Color
          // iconEnabledColor: Colors.teal,
          // iconDisabledColor: Colors.lime,
          // padding: const EdgeInsets.all(0),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          value: ExpenseTrackerCategories.singleExpenseMethod(state),
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
                          child: Text(
                            e.title.trim(),
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
            debugPrint('Selected ${s!.title} ${s.id}');
            context.read<DropdownExpenseMethodCubit>().changeIndex(s.id);
            debugPrint(
              'from the dropdown expense method cubit -> ${ExpenseTrackerCategories.singleExpenseMethod(state).id} | ${ExpenseTrackerCategories.singleExpenseMethod(state).title} ',
            );
          },
        );
      },
    );
  }
}
