import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/account_type_helper.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/local_mobile_banking.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/onboarding_account_setup_bloc.dart';
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
      // focusColor: Colors.white,
      items: accountTypesDBwithTrans(context)
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: ExpenseTrackerTextStyle.body3.copyWith(
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light80
                      : ExpenseTrackerColors.dark75,
                  // color: ExpenseTrackerColors.light80,
                ),
              ),
            ),
          )
          .toList(),
      isExpanded: true,
      decoration: dropdownInputDecoration(l10n.accountType),
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
