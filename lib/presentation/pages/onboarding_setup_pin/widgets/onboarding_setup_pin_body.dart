import 'package:expense_tracker/app/ui/app_ui.dart';
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

  Color getColor(String pin, int index) {
    // if the pin is empty, return the default color
    if (pin.isEmpty) {
      return ExpenseTrackerColors.violet;
    }
    // now check if the index is less than the length of the pin
    // if it is, return the default color
    if (index < pin.length) {
      return const Color(0xffeee5ff);
    }
    // if it is not, return the default color
    return ExpenseTrackerColors.violet;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<OnboardingSetupPinBloc, OnboardingSetupPinState>(
      buildWhen: (previous, current) => previous.pin != current.pin,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Let's setup your PIN",
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      backgroundColor: const Color(0xffeee5ff),
                      radius: 15,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: getColor(state.pin, i),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 50),
            // numbers
            SizedBox(
                height: size.height * 0.4,
                child: Row(
                  children: [
                    // 1, 4, 7 and $
                    ButtonRow([
                      Button(
                        text: '1',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '4',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '7',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '',
                        cb: (s) {
                          // context.read<ExpenseTextControllerCubit>().addText(s);
                        },
                      ),
                    ]),
                    // 2, 5, 8 and 0
                    ButtonRow([
                      Button(
                        text: '2',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '5',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '8',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '0',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                    ]),
                    // 3, 6, 9 and delete
                    ButtonRow([
                      Button(
                        text: '3',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '6',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      Button(
                        text: '9',
                        cb: (s) {
                          context.read<OnboardingSetupPinBloc>().add(
                                AddTextOnboardingSetupPinEvent(pin: s),
                              );
                        },
                      ),
                      if (state.pin.length == 4)
                        ArrowButton(
                          cb: (_) {
                            // goto next page
                          },
                        )
                      else
                        Button(
                          text: '',
                          cb: (s) {},
                        ),
                    ]),
                  ],
                )),
          ],
        );
      },
      listener: (BuildContext context, OnboardingSetupPinState state) {
        if (state is OnboardingSetupPinError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: ExpenseTrackerColors.red,
              content: Text('Pin must be 4 digits'),
            ),
          );
        }
      },
    );
  }
}
