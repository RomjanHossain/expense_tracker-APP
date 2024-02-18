import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/account_type_helper.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_mobile_banking.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/onboarding_account_setup_bloc.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';

class AccountTypeDropdown extends StatelessWidget {
  const AccountTypeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DropdownButtonFormField(
      dropdownColor: ExpenseTrackerColors.violet,
      items: accountTypesDBwithTrans(context)
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: ExpenseTrackerTextStyle.body3.copyWith(
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light80
                      : ExpenseTrackerColors.dark,
                ),
              ),
            ),
          )
          .toList(),
      isExpanded: true,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.violet,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.light60,
          ),
        ),
        hintText: l10n.accountType,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.light60,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: ExpenseTrackerColors.light20,
      ),
      onChanged: (d) {
        if (d is String) {
          context.read<OnboardingAccountSetupBloc>().add(
                AddAccountTypeEvent(AccountTypeHelper.fromString(d)),
              );
          // _onAccountTypeChanged(d);
        }
      },
    );
  }
}
