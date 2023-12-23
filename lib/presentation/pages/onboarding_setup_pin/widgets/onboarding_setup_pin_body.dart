import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/bloc/bloc.dart';
import 'package:expense_tracker/presentation/widgets/buttons/input_btn.dart';
import 'package:expense_tracker/presentation/widgets/buttons/single_btn.dart';
import 'package:flutter/material.dart';

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
        return Column(
          children: [
            Text('Let\'s setup your PIN'),
            Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        '*',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            // numbers
            Expanded(
                child: Row(
              children: [
                // 1, 4, 7 and $
                ButtonRow([
                  Button(
                    text: '1',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '4',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '7',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: r'$',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                ]),
                // 2, 5, 8 and 0
                ButtonRow([
                  Button(
                    text: '2',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '5',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '8',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '0',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                ]),
                // 3, 6, 9 and delete
                ButtonRow([
                  Button(
                    text: '3',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '6',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                  Button(
                    text: '9',
                    cb: (s) {
                      context.read<ExpenseTextControllerCubit>().addText(s);
                    },
                  ),
                ]),
              ],
            )),
          ],
        );
      },
    );
  }
}
