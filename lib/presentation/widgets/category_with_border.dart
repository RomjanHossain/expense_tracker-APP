
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWithBorder extends StatelessWidget {
  const CategoryWithBorder({
    required this.color, required this.title, super.key,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
