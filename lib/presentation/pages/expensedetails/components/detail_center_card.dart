import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCenterCard extends StatelessWidget {
  const DetailCenterCard({
    required this.subtitle,
    required this.title,
    super.key,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: ExpenseTrackerTextStyle.body3.copyWith(
            color: ExpenseTrackerColors.light20,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          subtitle,
          style: ExpenseTrackerTextStyle.body2.copyWith(
            color: isDarkMode(context)
                ? ExpenseTrackerColors.light
                : ExpenseTrackerColors.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
