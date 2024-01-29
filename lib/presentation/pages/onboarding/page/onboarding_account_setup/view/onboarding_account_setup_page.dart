import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/widgets/onboarding_account_setup_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template onboarding_account_setup_page}
/// A description for OnboardingAccountSetupPage
/// {@endtemplate}
class OnboardingAccountSetupPage extends StatelessWidget {
  /// {@macro onboarding_account_setup_page}
  const OnboardingAccountSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => OnboardingAccountSetupBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ExpenseTrackerColors.violet,
        appBar: AppBar(
          backgroundColor: ExpenseTrackerColors.violet,
          elevation: 0,
          title: Text(
            l10n.addNewAccount,
            style: const TextStyle(
              color: ExpenseTrackerColors.light,
            ),
          ),
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back, color: ExpenseTrackerColors.light),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: const OnboardingAccountSetupView(),
      ),
    );
  }
}

/// {@template onboarding_account_setup_view}
/// Displays the Body of OnboardingAccountSetupView
/// {@endtemplate}
class OnboardingAccountSetupView extends StatelessWidget {
  /// {@macro onboarding_account_setup_view}
  const OnboardingAccountSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingAccountSetupBody();
  }
}
