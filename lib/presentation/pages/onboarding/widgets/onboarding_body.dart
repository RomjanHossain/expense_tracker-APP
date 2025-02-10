import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/onboarding/cubit/cubit.dart';
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
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController _pageController = PageController();

  // Images for the onboarding pages
  final List<String> _images = [
    ExpenseAssets.gainTotalControlOfYourMoneyIll,
    ExpenseAssets.knowWhereYourMoneyGoesIll,
    ExpenseAssets.planningAheadIll,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, int>(
      listener: (context, state) {
        debugPrint('State changed to: $state');
        _pageController.animateToPage(
          state,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      },
      builder: (context, state) {
        final l10n = context.l10n;
        final subtitles = [
          l10n.onboardingSubtitle1,
          l10n.onboardingSubtitle2,
          l10n.onboardingSubtitle3,
        ];
        final titles = [
          l10n.onboardingTitle1,
          l10n.onboardingTitle2,
          l10n.onboardingTitle3,
        ];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // PageView for onboarding slides
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) =>
                    context.read<OnboardingCubit>().changeState(index),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          _images[index],
                          height: 200.h,
                          width: 200.w,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          titles[index],
                          style: ExpenseTrackerTextStyle.title1.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25.h),
                        Text(
                          subtitles[index],
                          style: ExpenseTrackerTextStyle.body1.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ExpenseTrackerColors.charcoal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Indicator dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (i) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: InkWell(
                    onTap: () => context.read<OnboardingCubit>().changeState(i),
                    child: CircleAvatar(
                      backgroundColor: state == i
                          ? ExpenseTrackerColors.violet
                          : ExpenseTrackerColors.violet20,
                      radius: state == i ? 10 : 5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // Start button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Hero(
                tag: 'intro',
                child: ElevatedButton(
                  onPressed: () async {
                    final prefs = SettingsLocalDataSourcePref();
                    await prefs.firstRunTrue();
                    if (!context.mounted) return;
                    await context.pushNamed('setup-profile');
                  },
                  child: Text(l10n.onboardingButton),
                ),
              ),
            ),

            // Import button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Hero(
                tag: 'import',
                child: OutlinedButton(
                  onPressed: () async {
                    await showDialog<void>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(l10n.importData),
                        content: const Text(
                          'This feature is not yet available. Please check back later.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(l10n.importData),
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
