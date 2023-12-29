import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/components/add_account_bottom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@template onboarding_account_setup_body}
/// Body of the OnboardingAccountSetupPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingAccountSetupBody extends StatefulWidget {
  /// {@macro onboarding_account_setup_body}
  const OnboardingAccountSetupBody({super.key});

  @override
  State<OnboardingAccountSetupBody> createState() =>
      _OnboardingAccountSetupBodyState();
}

class _OnboardingAccountSetupBodyState
    extends State<OnboardingAccountSetupBody> {
  final TextEditingController _accountBalanceController =
      TextEditingController();
  @override
  void dispose() {
    _accountBalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingAccountSetupBloc, OnboardingAccountSetupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Balance',
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  color: ExpenseTrackerColors.light80.withOpacity(0.64),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 10,
            //     vertical: 5,
            //   ),
            //   child: Text(
            //     '\$${state.createAccount.acBalance}',
            //     style: ExpenseTrackerTextStyle.titleX
            //         .copyWith(color: Colors.white),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _accountBalanceController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: ExpenseTrackerTextStyle.titleX.copyWith(
                  color: ExpenseTrackerColors.light80,
                ),
                onSubmitted: (value) {
                  context.read<OnboardingAccountSetupBloc>().add(
                        AddBalanceEvent(
                          double.parse(_accountBalanceController.text),
                        ),
                      );
                },
                onEditingComplete: () {
                  context.read<OnboardingAccountSetupBloc>().add(
                        AddBalanceEvent(
                          double.parse(_accountBalanceController.text),
                        ),
                      );
                },
                onChanged: (value) {
                  context.read<OnboardingAccountSetupBloc>().add(
                        AddBalanceEvent(
                          double.parse(_accountBalanceController.text),
                        ),
                      );
                },
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixIcon: const Icon(
                    Icons.attach_money,
                    color: ExpenseTrackerColors.light80,
                    size: 64,
                  ),
                  hintStyle: ExpenseTrackerTextStyle.titleX.copyWith(
                    color: ExpenseTrackerColors.light80,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const AddAccountBottomContainer(),
          ],
        );
      },
    );
  }
}
