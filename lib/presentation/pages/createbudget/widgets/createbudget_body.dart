import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/helper/helper_.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/createbudget/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template createbudget_body}
/// Body of the CreatebudgetPage.
///
/// Add what it does
/// {@endtemplate}
class CreatebudgetBody extends StatefulWidget {
  /// {@macro createbudget_body}
  const CreatebudgetBody({super.key});

  @override
  State<CreatebudgetBody> createState() => _CreatebudgetBodyState();
}

class _CreatebudgetBodyState extends State<CreatebudgetBody> {
  final _accountBalanceController = TextEditingController();

  @override
  void dispose() {
    _accountBalanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatebudgetCubit, CreatebudgetState>(
      builder: (context, state) {
        // return Center(child: Text(state.customProperty));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Text(
                'How much do yo want to spend?',
                style: ExpenseTrackerTextStyle.body2.copyWith(
                  color: ExpenseTrackerColors.light80,
                ),
              ),
            ),
            // dorra bil
            TextField(
              controller: _accountBalanceController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: ExpenseTrackerTextStyle.titleX.copyWith(
                color: ExpenseTrackerColors.light80,
              ),
              onSubmitted: (value) {},
              onEditingComplete: () {},
              onChanged: (value) {
                if (state.budget.amount != double.tryParse(value)) {
                  context.read<CreatebudgetCubit>().changeAmmount(
                        double.tryParse(value) ?? 0,
                      );
                }
                // context.read<CreatebudgetCubit>().changeAmmount(value);
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
            // form box
            AnimatedContainer(
              duration: 300.milliseconds,
              height: state.budget.isReceiveAlert ? 0.4.sh : 0.35.sh,
              // height: 0.3.sh,
              decoration: BoxDecoration(
                // color: ExpenseTrackerColors.light,
                color: !isDarkMode(context)
                    ? ExpenseTrackerColors.light
                    : ExpenseTrackerColors.dark,
                // border radius only top right/left
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // a dropdown of ExpenseTrackerCategories
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: DropdownButtonFormField<String>(
                      // borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
                      // underline: Container(),
                      hint: const Text('Select a category'),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: ExpenseTrackerColors.violet,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: ExpenseTrackerColors.light60,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: ExpenseTrackerColors.light60,
                          ),
                        ),
                      ),
                      isExpanded: true,
                      items: ExpenseTrackerCategories.expenseCategoriesStrings
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (s) {
                        if (s != null) {
                          context.read<CreatebudgetCubit>().changeCategory(s);
                        }
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Repeat',
                      style: TextStyle(
                        // color: ExpenseTrackerColors.dark25,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light
                            : ExpenseTrackerColors.dark25,
                      ),
                    ),
                    subtitle: const Text(
                      'Receive alert when it reaches some point.',
                      style: TextStyle(color: ExpenseTrackerColors.light20),
                    ),
                    trailing: Switch(
                      value: state.budget.isReceiveAlert,
                      onChanged: (value) {
                        if (value) {
                          context.read<CreatebudgetCubit>().activeAlert();
                        } else {
                          context.read<CreatebudgetCubit>().deactiveAlert();
                        }
                      },
                    ),
                  ),
                  // a linear slider
                  if (state.budget.isReceiveAlert)
                    SliderTheme(
                      data: SliderThemeData(
                        thumbShape: CustomRoundedRectangleBorder(),
                        valueIndicatorTextStyle:
                            const TextStyle(color: ExpenseTrackerColors.light),
                        showValueIndicator:
                            ShowValueIndicator.onlyForContinuous,
                      ),
                      child: Slider(
                        value: state.budget.percent,
                        label: '${state.budget.percent.toStringAsFixed(0)}%',

                        activeColor: ExpenseTrackerColors.violet,
                        inactiveColor: ExpenseTrackerColors.light40,
                        onChanged: (value) {
                          context
                              .read<CreatebudgetCubit>()
                              .changePercent(value);
                        },
                        // min: 0,
                        max: 100,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        // get all values
                        final amount = double.tryParse(
                          _accountBalanceController.text,
                        );
                        if (state.budget.amount == 0 || amount == null) {
                          // show error
                          showInfoToast(context, 'Please enter an amount');
                          return;
                        }
                        if (state.budget.category.isEmpty) {
                          showInfoToast(context, 'Please select a category');
                          return;
                        }
                        if (state.budget.isReceiveAlert) {
                          if (state.budget.percent == 0) {
                            showInfoToast(context, 'Please select a percent');
                            return;
                          }
                        }
                        // all okay
                        final x = await context
                            .read<CreatebudgetCubit>()
                            .createBudget();
                        debugPrint('x :$x');
                        if (x == -1) {
                          showFailureToast(context, 'Failed to create budget');
                          return;
                        }

                        showSuccessToast(
                            context, 'Budget created successfully',);
                        Navigator.pop(context);
                      },
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// RoundedRectangleBorder type shape using SliderComponentShape
class CustomRoundedRectangleBorder extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(12);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = ExpenseTrackerColors.violet
      ..style = PaintingStyle.fill;
    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: center,
        width: 24 * 1.6,
        height: 24,
      ),
      const Radius.circular(12),
    );
    canvas.drawRRect(rRect, paint);
  }
}
