import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/widgets/onboarding_account_setup_body.dart';
import 'package:expense_tracker/services/animation/page_animation.dart';
import 'package:flutter/material.dart';

/// {@template onboarding_account_setup_page}
/// A description for OnboardingAccountSetupPage
/// {@endtemplate}
class OnboardingAccountSetupPage extends StatelessWidget {
  /// {@macro onboarding_account_setup_page}
  const OnboardingAccountSetupPage({super.key});

  /// The static route for OnboardingAccountSetupPage
  static Route<dynamic> route() {
    return PageAnimation.fadeThroughTransitionPageWrapper(
      const OnboardingAccountSetupPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingAccountSetupBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ExpenseTrackerColors.violet,
        appBar: AppBar(
          backgroundColor: ExpenseTrackerColors.violet,
          elevation: 0,
          title: const Text(
            'Add new account',
            style: TextStyle(color: ExpenseTrackerColors.light),
          ),
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back, color: ExpenseTrackerColors.light),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
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
