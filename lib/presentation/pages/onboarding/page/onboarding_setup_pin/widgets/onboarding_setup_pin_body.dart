import 'dart:io';

import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_setup_pin/bloc/bloc.dart';
import 'package:expense_tracker/presentation/widgets/buttons/input_btn.dart';
import 'package:expense_tracker/presentation/widgets/buttons/single_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// {@template onboarding_setup_pin_body}
/// Body of the OnboardingSetupPinPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingSetupPinBody extends StatefulWidget {
  /// {@macro onboarding_setup_pin_body}
  const OnboardingSetupPinBody({super.key});

  @override
  State<OnboardingSetupPinBody> createState() => _OnboardingSetupPinBodyState();
}

class _OnboardingSetupPinBodyState extends State<OnboardingSetupPinBody> {
  final TextEditingController _controller = TextEditingController();
  // final _localPref = SettingsLocalDataSourcePref();
  // bool _isFirstTimeSetupPin = true;
  // String pin = '';
  @override
  void initState() {
    // _localPref.isFirstRun().then(
    //       (value) => _isFirstTimeSetupPin = value,
    //     );
    // _localPref.getPin().then(
    //       (value) => pin = value,
    //     );
    // debugPrint('This is pin -> $pin');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getColor(String pin, int index) {
    // now check if the index is less than the length of the pin
    // if it is, return the default color
    if (index < pin.length) {
      return ExpenseTrackerColors.violet20;
    }
    // if it is not, return the default color
    return ExpenseTrackerColors.violet;
  }

  int userAttempts = 0;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<OnboardingSetupPinBloc, OnboardingSetupPinState>(
      buildWhen: (previous, current) => previous.pin != current.pin,
      builder: (context, state) {
        // debugPrint('state -> ${state.pin}');
        // debugPrint(
        //   state.isFirstTime || state.userPin.isEmpty
        //       ? _controller.text.isNotEmpty && _controller.text.length == 4
        //           ? l10n.onboardingSetUpPin2
        //           : l10n.onboardingSetUpPin
        //       : l10n.onboardingSetUpPin3,
        // );
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                state.isFirstTime
                    ? state.attempts == 0
                        ? l10n.onboardingSetUpPin2
                        : l10n.onboardingSetUpPin
                    : l10n.onboardingSetUpPin3,
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  color: ExpenseTrackerColors.light,
                ),
              ),
            ),
            SizedBox(height: 20.h),
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
            SizedBox(height: 50.h),
            // numbers
            SizedBox(
              // height: size.height * 0.4,
              height: 0.4.sh,
              child: Row(
                children: [
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
                      cb: (s) async {
                        // context.read<ExpenseTextControllerCubit>().addText(s);
                        await SettingsLocalDataSourcePref().resetFirstRun();
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
                          //* if user first time setup pin

                          if (_controller.text.isNotEmpty &&
                              _controller.text.length == 4) {
                            if (state.isFirstTime || state.userPin.isEmpty) {
                              if (state.pin == _controller.text) {
                                context.read<OnboardingSetupPinBloc>().add(
                                      PinSaveOnboardingSetupPinEvent(
                                        pin: _controller.text,
                                      ),
                                    );
                                context.goNamed('account-setup-intro');
                                _controller
                                  ..clear()
                                  ..dispose();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: ExpenseTrackerColors.red,
                                    content: Text('Pin does not match'),
                                  ),
                                );
                                // clear the pin
                                context.read<OnboardingSetupPinBloc>().add(
                                      const ClearTextOnboardingSetupPinEvent(),
                                    );
                              }
                            } else {
                              // hah! user already set up their pin
                              //TODO: let's check it out
                              if (_controller.text == state.userPin) {
                                context.goNamed('home');
                              } else {
                                _controller.text = state.pin;
                                // clear the pin
                                context.read<OnboardingSetupPinBloc>().add(
                                      const ClearTextOnboardingSetupPinEvent(),
                                    );
                                //* user pin incorrenct
                                userAttempts += 1;
                                debugPrint('user attempts $userAttempts');

                                if (state.attempts == 3) {
                                  //! if 3 attemps then exit from the app
                                  exit(0);
                                }
                              }
                            }
                          } else {
                            _controller.text = state.pin;
                            // clear the pin
                            context.read<OnboardingSetupPinBloc>().add(
                                  const ClearTextOnboardingSetupPinEvent(),
                                );
                          }
                        },
                      )
                    else
                      Button(
                        text: '',
                        cb: (s) {
                          debugPrint('pin from the ldb -> ${state.pin}');
                          if (state.pin.isEmpty) {
                            debugPrint('statement');
                          } else {
                            debugPrint('not statement');
                          }
                        },
                      ),
                  ]),
                ],
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, OnboardingSetupPinState state) {
        if (state.isFirstTime) {
          debugPrint('Hey :${l10n.onboardingSetUpPin}');
          debugPrint('Hello :${l10n.onboardingSetUpPin2}');
        } else {
          debugPrint('SHIT: ${l10n.onboardingSetUpPin3}');
        }
        if (state is OnboardingSetupPinError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: ExpenseTrackerColors.red,
              content: Text('Pin must be 4 digits'),
            ),
          );
        } else if (state is OnboardingSetupPinSuccess) {
          context.goNamed('home');
        }
      },
    );
  }
}
