import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/createbudget/cubit/cubit.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:flutter/gestures.dart';
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
            const Text('How much do yo want to spend?'),
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
              onChanged: (value) {},
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
              height: 0.4.sh,
              // height: 0.3.sh,
              decoration: BoxDecoration(
                color: ExpenseTrackerColors.light,
                // border radius only top right/left
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      onChanged: (s) {},
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Repeat',
                      style: TextStyle(
                        color: ExpenseTrackerColors.dark25,
                      ),
                    ),
                    // subtitle:  Text(
                    //   'Repeat transaction',
                    //   style: TextStyle(
                    //     color: ExpenseTrackerColors.light20,
                    //   ),
                    // ),
                    subtitle: const Text(
                      'Receive alert when it reaches some point.',
                      style: TextStyle(color: ExpenseTrackerColors.light20),
                    ),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  // a linear slider
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: CustomRoundedRectangleBorder(),
                    ),
                    child: Slider(
                      value: 50,
                      label: '50%',
                      activeColor: ExpenseTrackerColors.violet,
                      inactiveColor: ExpenseTrackerColors.light40,
                      onChanged: (value) {},
                      min: 5,
                      max: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: PrimaryButton(onPress: () {}, text: 'Continue'),
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
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
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
