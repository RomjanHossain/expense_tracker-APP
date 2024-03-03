import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSegmentedButtonsWidget extends StatelessWidget {
  const HomeSegmentedButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
      child: SegmentedButton<SegmentedButtonsData>(
        showSelectedIcon: false,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(
            (states) => ExpenseTrackerTextStyle.body3.copyWith(
              color: states.contains(MaterialState.selected)
                  ? ExpenseTrackerColors.yellow
                  : ExpenseTrackerColors.yellow,
              fontWeight: states.contains(MaterialState.selected)
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide.none,
          ),
          // backgroundColor: MaterialStateProperty.all(
          //   ExpenseTrackerColors.yellow20,
          // ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? ExpenseTrackerColors.yellow20
                : theme.scaffoldBackgroundColor,
          ),
        ),
        segments: [
          ButtonSegment<SegmentedButtonsData>(
            label: Text(
              'Today',
              style: ExpenseTrackerTextStyle.body3.copyWith(
                color: ExpenseTrackerColors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            value: SegmentedButtonsData.today,
          ),
          ButtonSegment<SegmentedButtonsData>(
            label: Text(
              'Week',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            value: SegmentedButtonsData.week,
          ),
          ButtonSegment<SegmentedButtonsData>(
            label: Text(
              'Month',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            value: SegmentedButtonsData.month,
          ),
          ButtonSegment<SegmentedButtonsData>(
            label: Text(
              'Year',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            value: SegmentedButtonsData.year,
          ),
        ],
        selected: const {SegmentedButtonsData.today},
      ),
    );
  }
}
