import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup_intro/widgets/onboarding_account_setup_intro_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template onboarding_account_setup_intro_page}
/// A description for OnboardingAccountSetupIntroPage
/// {@endtemplate}
class OnboardingAccountSetupIntroPage extends StatelessWidget {
  /// {@macro onboarding_account_setup_intro_page}
  const OnboardingAccountSetupIntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: const OnboardingAccountSetupIntroView(),
      bottomNavigationBar: BottomAppBar(
        color: ExpenseTrackerColors.scaffoldBackground,
        elevation: 0,
        child: Hero(
          tag: 'onboarding_account_setup_intro_button',
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, OnboardingAccountSetupPage.route());
              context.pushNamed(
                'account-setup',
              );
            },
            child: Text(l10n.onboardingAccountSetupBtn),
          ),
        ),
      ),
    );
  }
}

/// {@template onboarding_account_setup_intro_view}
/// Displays the Body of OnboardingAccountSetupIntroView
/// {@endtemplate}
class OnboardingAccountSetupIntroView extends StatelessWidget {
  /// {@macro onboarding_account_setup_intro_view}
  const OnboardingAccountSetupIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingAccountSetupIntroBody();
  }
}
