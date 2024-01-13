
import 'dart:ui';

import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieChartBelowDataComponent extends StatelessWidget {
  const PieChartBelowDataComponent({
    required this.title,
    required this.amount,
    required this.color,
    super.key,
  });

  final String title;
  final double amount;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ExpenseTrackerColors.light80,
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: ExpenseTrackerColors.light60,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 5.r,
                    backgroundColor: color,
                  ),
                  SizedBox(width: 10.w),
                  Text(title),
                ],
              ),
            ),
            Text(
              '\$$amount',
              style: ExpenseTrackerTextStyle.body2.copyWith(
                fontWeight: FontWeight.bold,
                color: amount < 0
                    ? ExpenseTrackerColors.red
                    : ExpenseTrackerColors.green,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        // linear progress bar
        LinearProgressIndicator(
          value: 0.7,
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
          minHeight: 8.h,
          backgroundColor: ExpenseTrackerColors.light60,
          valueColor: AlwaysStoppedAnimation<Color>(
            color,
          ),
        ),
      ],
    );
  }
}
