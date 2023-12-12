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
    return BlocConsumer<DropdownExpenseMethodCubit, String>(
      builder: (context, state) {
        return DropdownButton<CategoryModel>(
          onTap: () {
            debugPrint(
                "Dropdown value cubit -> ${context.read<DropdownExpenseMethodCubit>().state}");
          },
          borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
          underline: Container(),
          isExpanded: true, //Adding this property, does the magic
          hint: const Text('Expenses'),
          icon: const Icon(Icons.keyboard_arrow_down),
          alignment: Alignment.center,
          dropdownColor: const Color(0xfff5f5f5), // Dropdown open Color
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          value: ExpenseTrackerCategories.singleexpensesCategory(state),
          items: ExpenseTrackerCategories.expensesCategories
              .map(
                (e) => DropdownMenuItem<CategoryModel>(
                  value: e,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(e.icon),
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
            // debugPrint('Selected ${s!.title} ${s.id}');
            context.read<DropdownExpenseMethodCubit>().changeValue(s!.id);
            debugPrint(
                "Dropdown value cubit -> ${context.read<DropdownExpenseMethodCubit>().state}");
            // debugPrint(
            //   'from the dropdown expense method cubit -> ${ExpenseTrackerCategories.singleExpenseMethod(state).id} | ${ExpenseTrackerCategories.singleExpenseMethod(state).title} ',
            // );
          },
        );
      },
      listener: (BuildContext context, String state) {},
    );
  }
}
