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
                  )),
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
              ),
            ),
            value: SegmentedButtonsData.today,
          ),
          const ButtonSegment<SegmentedButtonsData>(
            label: Text('Week'),
            value: SegmentedButtonsData.week,
          ),
          const ButtonSegment<SegmentedButtonsData>(
            label: Text('Month'),
            value: SegmentedButtonsData.month,
          ),
          const ButtonSegment<SegmentedButtonsData>(
            label: Text('Year'),
            value: SegmentedButtonsData.year,
          ),
        ],
        selected: const {SegmentedButtonsData.today},
      ),
    );
  }
}
