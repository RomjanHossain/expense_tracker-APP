import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/theme.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
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
          // dropdownColor: ExpenseTrackerColors.violet, // Dropdown open Color
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
                          color: ExpenseTrackerColors.green,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            e.title.trim(),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(
                            //   color: state == e.id
                            //       ? ExpenseTrackerColors.dark50
                            //       : ExpenseTrackerColors
                            //           .light80, // Change text color based on selection
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (s) {
            context.read<DropdownExpenseMethodCubit>().changeValue(s!.id);
            debugPrint(
              'Dropdown value cubit -> ${context.read<DropdownExpenseMethodCubit>().state}',
            );
          },
        );
      },
      listener: (BuildContext context, String state) {},
    );
  }
}
