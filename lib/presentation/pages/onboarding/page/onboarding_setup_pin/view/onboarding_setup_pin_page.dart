import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_setup_pin/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_setup_pin/widgets/onboarding_setup_pin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template onboarding_setup_pin_page}
/// A description for OnboardingSetupPinPage
/// {@endtemplate}
class OnboardingSetupPinPage extends StatelessWidget {
  /// {@macro onboarding_setup_pin_page}
  const OnboardingSetupPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingSetupPinBloc()
        ..add(const FirstRunOnboardingSetupPinEvent()),
      child: const Scaffold(
        backgroundColor: ExpenseTrackerColors.violet,
        body: OnboardingSetupPinView(),
      ),
    );
  }
} 

/// {@template onboarding_setup_pin_view}
/// Displays the Body of OnboardingSetupPinView
/// {@endtemplate}
class OnboardingSetupPinView extends StatelessWidget {
  /// {@macro onboarding_setup_pin_view}
  const OnboardingSetupPinView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingSetupPinBody();
  }
}
