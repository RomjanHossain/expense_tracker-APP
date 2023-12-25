import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup_intro/widgets/onboarding_account_setup_intro_body.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

/// {@template onboarding_account_setup_intro_page}
/// A description for OnboardingAccountSetupIntroPage
/// {@endtemplate}
class OnboardingAccountSetupIntroPage extends StatelessWidget {
  /// {@macro onboarding_account_setup_intro_page}
  const OnboardingAccountSetupIntroPage({super.key});

  /// The static route for OnboardingAccountSetupIntroPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OnboardingAccountSetupIntroPage());
  }
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const OnboardingAccountSetupIntroView(),
      bottomNavigationBar: BottomAppBar(
          color: ExpenseTrackerColors.scaffoldBackground,
          elevation: 0,
          child: PrimaryButton(onPress: () {}, text: 'Let’s go'),
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
