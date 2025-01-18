import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/bottom_icon_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExpanseTrackerBottomNavBar extends StatelessWidget {
  const ExpanseTrackerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final svgIcons = BottomIconSvgs.instance.svgIcons;
    final l10n = context.l10n;
    final isDark = isDarkMode(context);
    final texts = <String>[
      l10n.navFirst,
      l10n.navSecond,
      l10n.navThird,
      l10n.navFourth,
    ];
    final currentIndex =
        context.select((AppHomePageBloc bloc) => bloc.state.currentIndex);

    return AnimatedBottomNavigationBar.builder(
      onTap: (index) {
        context.read<AppHomePageBloc>().add(ChangeAppHomePageEvent(index));
      },
      backgroundColor:
          isDark ? ExpenseTrackerColors.dark75 : ExpenseTrackerColors.light80,
      activeIndex: currentIndex,
      height: 60.h,
      itemCount: svgIcons.length, // Dynamically handle itemCount
      gapLocation: GapLocation.center,
      elevation: 0,
      notchSmoothness: NotchSmoothness.defaultEdge,
      tabBuilder: (index, isActive) {
        final color = isActive
            ? ExpenseTrackerColors.violet
            : ExpenseTrackerColors.charcoal;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset(
                svgIcons[index],
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                height: 24.h,
              ),
            ),
            Text(
              texts[index],
              style: ExpenseTrackerTextStyle.small.copyWith(
                color: color,
                fontSize: 10.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}
