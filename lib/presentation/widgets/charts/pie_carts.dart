import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpensePieGraph extends StatelessWidget {
  const ExpensePieGraph({
    required this.pieRadius,
    super.key,
  });

  final double pieRadius;
  // final List<FlSpot> spots;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        // color: Color(0xff232d37),
      ),
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            enabled: true,
          ),
          sections: [
            PieChartSectionData(
              color: ExpenseTrackerColors.violet,
              value: pieRadius,
              radius: pieRadius,
              showTitle: false,
            ),
            PieChartSectionData(
              color: ExpenseTrackerColors.blue,
              value: 25,
              showTitle: false,
              radius: pieRadius,
            ),
            PieChartSectionData(
              color: ExpenseTrackerColors.green,
              value: 25,
              showTitle: false,
              radius: pieRadius,
            ),
            PieChartSectionData(
              color: ExpenseTrackerColors.yellow,
              value: 25,
              showTitle: false,
              radius: pieRadius,
            ),
          ],
          borderData: FlBorderData(
            show: false,
          ),
          centerSpaceRadius: 90.r,
          sectionsSpace: 0,
        ),
      ),
    );
  }
}
