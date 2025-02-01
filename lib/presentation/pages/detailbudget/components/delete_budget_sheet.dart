import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveSheet extends StatelessWidget {
  const RemoveSheet({
    required this.title,
    required this.subtitle,
    required this.onRemove,
    super.key,
  });
  final String title;
  final String subtitle;
  final VoidCallback onRemove;
  // final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: ExpenseTrackerColors.light,
        color: !isDarkMode(context)
            ? ExpenseTrackerColors.light
            : ExpenseTrackerColors.dark,
        borderRadius: BorderRadius.circular(30.r),
      ),
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: ExpenseTrackerTextStyle.title3.copyWith(
              fontWeight: FontWeight.bold,
              color: !isDarkMode(context)
                  ? ExpenseTrackerColors.dark
                  : ExpenseTrackerColors.light,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            subtitle,
            style: ExpenseTrackerTextStyle.body1.copyWith(
              color: ExpenseTrackerColors.light20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // cancel
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No'),
                ),
              ),
              SizedBox(width: 10.w),
              // delete
              Expanded(
                child: ElevatedButton(
                  onPressed: onRemove,
                  child: const Text('Yes'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
