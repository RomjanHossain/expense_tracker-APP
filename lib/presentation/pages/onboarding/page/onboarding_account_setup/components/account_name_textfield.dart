
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/onboarding_account_setup.dart';
import 'package:flutter/material.dart';

class AccountNameTextField extends StatelessWidget {
  const AccountNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextField(
      keyboardType: TextInputType.name,
      onChanged: (d) => context.read<OnboardingAccountSetupBloc>().add(
              AddAccountNameEvent(d),
            ),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.violet,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.light60,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: ExpenseTrackerColors.light60,
          ),
        ),
        hintText: l10n.accountName,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
    );
  }
}
