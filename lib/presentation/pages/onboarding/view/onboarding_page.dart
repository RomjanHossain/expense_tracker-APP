import 'package:expense_tracker/presentation/pages/onboarding/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/onboarding/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

/// {@template onboarding_page}
/// A description for OnboardingPage
/// {@endtemplate}
class OnboardingPage extends StatelessWidget {
  /// {@macro onboarding_page}
  const OnboardingPage({super.key});

  /// The static route for OnboardingPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OnboardingPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit()..changeIndex(),
      child: const Scaffold(
        body: OnboardingView(),
      ),
    );
  }
}

/// {@template onboarding_view}
/// Displays the Body of OnboardingView
/// {@endtemplate}
class OnboardingView extends StatelessWidget {
  /// {@macro onboarding_view}
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingBody();
  }
}
