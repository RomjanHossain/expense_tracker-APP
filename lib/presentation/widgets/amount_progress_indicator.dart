import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountProgressIndicator extends StatelessWidget {
  const AmountProgressIndicator({
    required this.color,
    required this.value,
    super.key,
  });

  final Color color;
  final double value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      borderRadius: BorderRadius.all(
        Radius.circular(50.r),
      ),
      minHeight: 10.h,
      backgroundColor: ExpenseTrackerColors.light60,
      valueColor: AlwaysStoppedAnimation<Color>(
        color,
      ),
    );
  }
}
