import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';

/// {@template onboarding_account_setup_body}
/// Body of the OnboardingAccountSetupPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingAccountSetupBody extends StatelessWidget {
  /// {@macro onboarding_account_setup_body}
  const OnboardingAccountSetupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingAccountSetupBloc, OnboardingAccountSetupState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
