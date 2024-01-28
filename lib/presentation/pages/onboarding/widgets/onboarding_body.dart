import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/onboarding/cubit/cubit.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<String> _images = [
    ExpenseAssets.gainTotalControlOfYourMoneyIll,
    ExpenseAssets.knowWhereYourMoneyGoesIll,
    ExpenseAssets.planningAheadIll,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      buildWhen: (previous, current) {
        if (previous == current) {
          return false;
        }
        _pageController.animateToPage(
          current,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
        return previous != current;
      },
      builder: (context, state) {
        final l10n = context.l10n;
        final List<String> _subtitles = [
          l10n.onboardingSubtitle1,
          l10n.onboardingSubtitle2,
          l10n.onboardingSubtitle3,
        ];
        final List<String> _titles = [
          l10n.onboardingTitle1,
          l10n.onboardingSubtitle2,
          l10n.onboardingSubtitle3,
        ];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(
                  overscroll: true,
                  physics: const BouncingScrollPhysics(),
                ),
                child: PageView.builder(
                  onPageChanged: (value) {
                    context.read<OnboardingCubit>().changeState(value);
                    _pageController.animateToPage(
                      value,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeIn,
                    );
                  },
                  controller: _pageController,
                  itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  // scrollBehavior: const ScrollBehavior().copyWith(
                  //     overscroll: true, physics: const BouncingScrollPhysics()),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            _images[index],
                            height: 200.h,
                            width: 200.w,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _titles[index],
                            style: ExpenseTrackerTextStyle.title1!
                                .copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            _subtitles[index],
                            style: ExpenseTrackerTextStyle.body1.copyWith(
                              fontWeight: FontWeight.w400,
                              color: ExpenseTrackerColors.charcoal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  InkWell(
                    onTap: () {
                      context.read<OnboardingCubit>().changeState(i);
                      _pageController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        backgroundColor: state == i.toDouble()
                            ? ExpenseTrackerColors.violet
                            : ExpenseTrackerColors.violet20,
                        radius: state == i ? 10 : 5,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Hero(
                tag: 'intro',
                child: PrimaryButton(
                  onPress: () {
                    context.pushNamed('setup-pin');
                  },
                  text: l10n.onboardingButton,
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        );
      },
    );
  }
}
