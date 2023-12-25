import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
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
    return  Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  bottom: 30,
                ),
                child: Text(
                  "Let's setup your account!",
                  style: ExpenseTrackerTextStyle.title1.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'Account can be your bank, credit card or your wallet.',
                style: ExpenseTrackerTextStyle.regular3,
              ),
            ],
          ),
        );
  }
}
