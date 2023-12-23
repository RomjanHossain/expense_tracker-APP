import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/bloc/bloc.dart';

/// {@template onboarding_setup_pin_body}
/// Body of the OnboardingSetupPinPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingSetupPinBody extends StatelessWidget {
  /// {@macro onboarding_setup_pin_body}
  const OnboardingSetupPinBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingSetupPinBloc, OnboardingSetupPinState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
