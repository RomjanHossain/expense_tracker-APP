import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    final count =
        context.select((AppHomePageBloc bloc) => bloc.state.currentIndex);
    return AnimatedBottomNavigationBar.builder(
      onTap: (p0) {
        context.read<AppHomePageBloc>().add(ChangeAppHomePageEvent(p0));
      },
      activeIndex: count,
      itemCount: 4,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      tabBuilder: (index, isActive) {
        final color = isActive
            ? ExpenseTrackerColors.primary
            : ExpenseTrackerColors.charcoal;
        return Icon(
          icons[index],
          color: color,
        );
      },
    );
  }
}
