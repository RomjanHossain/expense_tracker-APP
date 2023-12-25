import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/widgets/onboarding_account_setup_body.dart';

/// {@template onboarding_account_setup_page}
/// A description for OnboardingAccountSetupPage
/// {@endtemplate}
class OnboardingAccountSetupPage extends StatelessWidget {
  /// {@macro onboarding_account_setup_page}
  const OnboardingAccountSetupPage({super.key});

  /// The static route for OnboardingAccountSetupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OnboardingAccountSetupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingAccountSetupBloc(),
      child: const Scaffold(
        body: OnboardingAccountSetupView(),
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
