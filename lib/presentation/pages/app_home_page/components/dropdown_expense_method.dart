import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/theme.dart';
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
        return DropdownButtonFormField<CategoryModel>(
          onTap: () {
            debugPrint(
              'Dropdown value cubit -> ${context.read<DropdownExpenseMethodCubit>().state}',
            );
          },
          borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
          // underline: Container(),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: ExpenseTrackerColors.violet,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: ExpenseTrackerColors.light60,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: ExpenseTrackerColors.light60,
              ),
            ),
          ),
          isExpanded: true, //Adding this property, does the magic
          hint: const Text(
            'Expenses',
            style: TextStyle(
              color: ExpenseTrackerColors.light20,
            ),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ExpenseTrackerColors.light20,
          ),
          alignment: Alignment.centerLeft,
          dropdownColor: ExpenseTrackerColors.violet, // Dropdown open Color

          value: ExpenseTrackerCategories.singleexpensesCategory(state),
          items: ExpenseTrackerCategories.expensesCategories
              .map(
                (e) => DropdownMenuItem<CategoryModel>(
                  value: e,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.icon,
                        style: const TextStyle(
                          color: ExpenseTrackerColors.light20,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            e.title.trim(),
                            // softWrap: false,

                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            // style: ExpenseTrackerTextStyle.caption,
                            style: const TextStyle(
                              color: ExpenseTrackerColors.light20,
                            ),
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
              'Dropdown value cubit -> ${context.read<DropdownExpenseMethodCubit>().state}',
            );
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
