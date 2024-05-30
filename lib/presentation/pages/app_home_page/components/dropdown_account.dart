import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/theme.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_account_cubit.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:flutter/material.dart';

class AccountListDropdown extends StatelessWidget {
  const AccountListDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownAccountCubit,
        (List<AccountEntity>, AccountEntity?)>(
      buildWhen: (
        (List<AccountEntity>, AccountEntity?) previousState,
        (List<AccountEntity>, AccountEntity?) currentState,
      ) {
        print('previousState: ${previousState.$1.length}');
        print('currentState: ${currentState.$1.length}');
        if (previousState.$1.length != currentState.$1.length) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return DropdownButtonFormField<AccountEntity>(
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
          dropdownColor: ExpenseTrackerColors.violet, // Dropdown open Color
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: ExpenseTrackerColors.light20,
          ),
          // value: CategoryModel(title: 'Housing', icon: Icons.house),
          hint: const Text(
            'Wallet',
            style: TextStyle(
              color: ExpenseTrackerColors.light20,
            ),
          ),
          alignment: Alignment.centerLeft,
          items: state.$1
              .map(
                (e) => DropdownMenuItem<AccountEntity>(
                  value: e,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   e.accountTypeImg,
                      //   style: const TextStyle(
                      //     color: ExpenseTrackerColors.green,
                      //   ),
                      // ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            e.accountName ?? '',
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
            context.read<DropdownAccountCubit>().changeSelectedAccount(s);
          },
        );
      },
    );
  }
}
