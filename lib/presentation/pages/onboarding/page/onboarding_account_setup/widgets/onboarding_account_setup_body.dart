import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/components/add_account_bottom_container.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Balance',
              style: ExpenseTrackerTextStyle.title3.copyWith(
                color: ExpenseTrackerColors.light80.withOpacity(0.64),
              ),
            ),
            Text(
              r'$0.00',
              style:
                  ExpenseTrackerTextStyle.titleX.copyWith(color: Colors.white),
            ),
            const AddAccountBottomContainer(),
          ],
        );
      },
    );
  }
}
