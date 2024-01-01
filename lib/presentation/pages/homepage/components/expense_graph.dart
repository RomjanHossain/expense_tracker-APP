import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeExpenseGraph extends StatelessWidget {
  const HomeExpenseGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        // color: Color(0xff232d37),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          titlesData: const FlTitlesData(
            show: false,
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              color: ExpenseTrackerColors.violet,
              isCurved: true,
              barWidth: 6.h,
              isStrokeCapRound: true,
              dotData: const FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xffCA50FF).withOpacity(0.24),
                    const Color(0xff8B50FF).withOpacity(0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
