import 'dart:async';

import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@template onboarding_body}
/// Body of the OnboardingPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingBody extends StatefulWidget {
  /// {@macro onboarding_body}
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      ExpenseAssets.gainTotalControlOfYourMoneyIll,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Gain total control of your money',
                      style: ExpenseTrackerTextStyle.title1!
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Become your own money manager and make every cent count',
                      style: ExpenseTrackerTextStyle.regular1.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ExpenseTrackerColors.charcoal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  backgroundColor: _pageController.page == i.toDouble()
                      ? ExpenseTrackerColors.violet
                      : ExpenseTrackerColors.violet20,
                  radius: _pageController.page == i ? 10 : 5,
                ),
              ),
            // CircleAvatar(
            //   backgroundColor: ExpenseTrackerColors.violet,
            //   radius: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: CircleAvatar(
            //     radius: 5,
            //   ),
            // ),
            // CircleAvatar(
            //   radius: 5,
            // ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: PrimaryButton(onPress: () {}, text: 'Set up your account'),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
