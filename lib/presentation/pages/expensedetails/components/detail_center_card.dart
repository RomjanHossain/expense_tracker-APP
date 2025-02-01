import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
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
    String truncateString(String text, int maxLength) {
      if (text.length > maxLength) {
        return '${text.substring(0, maxLength)}...';
      }
      return text;
    }

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
          truncateString(subtitle, 8),
          style: ExpenseTrackerTextStyle.body2.copyWith(
            color: isDarkMode(context)
                ? ExpenseTrackerColors.light
                : ExpenseTrackerColors.dark,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis, // Add this line
          maxLines: 2,
        ),
      ],
    );
  }
}
