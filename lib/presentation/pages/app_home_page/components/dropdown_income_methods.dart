import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:expense_tracker/utils/utils_.dart';
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
          elevation: 2,
          isExpanded: true, //Adding this property, does the magic
          dropdownColor: ExpenseTrackerColors.violet, // Dropdown open Color
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
            // style: ExpenseTrackerTextStyle.body2,
            // textAlign: TextAlign.start,
          ),
          // padding: const EdgeInsets.all(0),
          // value: ExpenseTrackerCategories.singleIncomeMethods(state),

          alignment: Alignment.centerLeft,
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 10,
          // ),
          items: ExpenseTrackerCategories.incomeMethods
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
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              // color: ExpenseTrackerColors.dark50,
                              color: isDarkMode(context)
                                  ? ExpenseTrackerColors.light80
                                  : ExpenseTrackerColors.dark50,
                            ),
                            // style: ExpenseTrackerTextStyle.caption,
                          ),
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
