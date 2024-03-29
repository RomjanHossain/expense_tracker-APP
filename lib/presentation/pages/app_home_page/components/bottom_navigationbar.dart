import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/gen/assets.gen.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExpanseTrackerBottomNavBar extends StatelessWidget {
  const ExpanseTrackerBottomNavBar({
    super.key,
  });

  /// icons for the page
  static const icons = <IconData>[
    Icons.home_rounded,
    Icons.pie_chart_rounded,
    Icons.bar_chart_rounded,
    Icons.settings_rounded,
  ];

  // svg icons bototm
  static final svgIcons = <String>[
    Assets.icons.home.path,
    Assets.icons.transaction.path,
    Assets.icons.pieChart.path,
    Assets.icons.user.path,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // l10n.localeName
    // botom texts
    final texts = <String>[
      l10n.navFirst,
      l10n.navSecond,
      l10n.navThird,
      l10n.navFourth,
    ];
    final count =
        context.select((AppHomePageBloc bloc) => bloc.state.currentIndex);
    return AnimatedBottomNavigationBar.builder(
      onTap: (p0) {
        context.read<AppHomePageBloc>().add(ChangeAppHomePageEvent(p0));
      },
      backgroundColor: isDarkMode(context)
          ? ExpenseTrackerColors.dark75
          : ExpenseTrackerColors.light80,
      // borderColor: theme.brightness == Brightness.light
      //     ? ExpenseTrackerColors.light80
      //     : ExpenseTrackerColors.dark75,
      activeIndex: count,
      height: 60.h,
      itemCount: 4,
      gapLocation: GapLocation.center,
      // splashColor: ExpenseTrackerColors.violet,
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
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: SvgPicture.asset(
                svgIcons[index],
                color: color,
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
