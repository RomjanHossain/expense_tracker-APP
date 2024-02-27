import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/widgets/onboarding_profile_setup_body.dart';
import 'package:flutter/material.dart';

/// {@template onboarding_profile_setup_page}
/// A description for OnboardingProfileSetupPage
/// {@endtemplate}
class OnboardingProfileSetupPage extends StatelessWidget {
  /// {@macro onboarding_profile_setup_page}
  const OnboardingProfileSetupPage({super.key});

  /// The static route for OnboardingProfileSetupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const OnboardingProfileSetupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingProfileSetupCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: const OnboardingProfileSetupView(),
      ),
    );
  }
}

/// {@template onboarding_profile_setup_view}
/// Displays the Body of OnboardingProfileSetupView
/// {@endtemplate}
class OnboardingProfileSetupView extends StatelessWidget {
  /// {@macro onboarding_profile_setup_view}
  const OnboardingProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingProfileSetupBody();
  }
}
