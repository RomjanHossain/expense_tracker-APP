import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/widgets/amount_progress_indicator.dart';
import 'package:expense_tracker/presentation/widgets/category_with_border.dart';
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
            CategoryWithBorder(color: color, title: title),
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
        AmountProgressIndicator(color: color, value: 0.3,),
      ],
    );
  }
}
