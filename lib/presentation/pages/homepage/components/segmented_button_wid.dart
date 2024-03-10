import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/homepage_bloc.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSegmentedButtonsWidget extends StatelessWidget {
  const HomeSegmentedButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final homeState = context.read<HomepageBloc>().state;
    final theme = Theme.of(context);
    return BlocConsumer<HomepageBloc, HomepageState>(
      buildWhen: (previous, current) => previous.se != current.se,
      builder: (context, homeState) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
          child: SegmentedButton<SegmentedButtonsData>(
            showSelectedIcon: false,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                (states) => ExpenseTrackerTextStyle.body3.copyWith(
                  color: ExpenseTrackerColors.yellow,
                  fontWeight: states.contains(MaterialState.selected)
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              // side: MaterialStateProperty.all(
              //   BorderSide.none,
              // ),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.selected)
                    ? ExpenseTrackerColors.yellow20
                    : theme.scaffoldBackgroundColor,
              ),
            ),
            onSelectionChanged: (Set<SegmentedButtonsData> p0) {
              context.read<HomepageBloc>().add(ChangeTheFreq(p0.first));
            },
            segments: [
              for (final i in SegmentedButtonsData.values)
                ButtonSegment<SegmentedButtonsData>(
                  label: Text(
                    getSegemtedButtonText(i),
                    style: ExpenseTrackerTextStyle.body3.copyWith(
                      color: homeState.se == i
                          ? ExpenseTrackerColors.yellow
                          : isDarkMode(context)
                              ? ExpenseTrackerColors.light
                              : ExpenseTrackerColors.dark25,
                      fontWeight: homeState.se == i ? FontWeight.bold : null,
                      fontSize: 14.sp,
                    ),
                  ),
                  value: i,
                ),
            ],
            selected: {
              homeState.se,
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
