import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// {@template onboarding_account_setup_intro_body}
/// Body of the OnboardingAccountSetupIntroPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingAccountSetupIntroBody extends StatelessWidget {
  /// {@macro onboarding_account_setup_intro_body}
  const OnboardingAccountSetupIntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              bottom: 30,
            ),
            child: Text(
              l10n.onboardingAccountSetup,
              style: ExpenseTrackerTextStyle.title1.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            l10n.onboardingAccountSetup2,
            style: ExpenseTrackerTextStyle.body3,
          ),
        ],
      ),
    );
  }
}
