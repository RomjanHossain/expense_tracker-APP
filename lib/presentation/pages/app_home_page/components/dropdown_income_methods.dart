import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:flutter/material.dart';

class IncomeMehodsDropdown extends StatelessWidget {
  const IncomeMehodsDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownIncomeMethodCubit, String>(
      builder: (context, state) {
        return DropdownButtonFormField<CategoryModel>(
          borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
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
          elevation: 2,
          isExpanded: true, //Adding this property, does the magic
          // dropdownColor: ExpenseTrackerColors.violet, // Dropdown open Color
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ExpenseTrackerColors.light20,
          ),
          // value: CategoryModel(title: 'Housing', icon: Icons.house),
          hint: const Text(
            'Income Source',
            style: TextStyle(
              color: ExpenseTrackerColors.light20,
            ),
          ),
          alignment: Alignment.centerLeft,
          items: ExpenseTrackerCategories.incomeMethods
              .map(
                (e) => DropdownMenuItem<CategoryModel>(
                  value: e,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e.icon,
                        style: const TextStyle(
                          color: ExpenseTrackerColors.green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          e.title.trim(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              // color: ExpenseTrackerColors.dark50,
                              // color: isDarkMode(context)
                              //     ? ExpenseTrackerColors.light80
                              //     : ExpenseTrackerColors.dark50,
                              // color: state == e.id
                              //     ? ExpenseTrackerColors.dark50
                              //     : ExpenseTrackerColors.light80,
                              ),
                          // style: ExpenseTrackerTextStyle.caption,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (s) {
            context.read<DropdownIncomeMethodCubit>().changeValue(s!.id);
          },
        );
      },
    );
  }
}
