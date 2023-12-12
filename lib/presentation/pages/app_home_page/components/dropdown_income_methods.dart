import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:flutter/material.dart';

class IncomeMehodsDropdown extends StatefulWidget {
  const IncomeMehodsDropdown({
    super.key,
  });

  @override
  State<IncomeMehodsDropdown> createState() => _IncomeMehodsDropdownState();
}

class _IncomeMehodsDropdownState extends State<IncomeMehodsDropdown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownIncomeMethodCubit, String>(
      builder: (context, state) {
        return DropdownButton<CategoryModel>(
          borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
          underline: Container(),
          isExpanded: true, //Adding this property, does the magic
          dropdownColor: const Color(0xfff5f5f5), // Dropdown open Color
          icon: const Icon(Icons.keyboard_arrow_down),
          // value: CategoryModel(title: 'Housing', icon: Icons.house),
          hint: const Text('Income Source'),
          // padding: const EdgeInsets.all(0),
          value: ExpenseTrackerCategories.singleIncomeMethods(state),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          items: ExpenseTrackerCategories.incomeMethods
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
            context.read<DropdownIncomeMethodCubit>().changeValue(s!.id);
          },
        );
      },
    );
  }
}
