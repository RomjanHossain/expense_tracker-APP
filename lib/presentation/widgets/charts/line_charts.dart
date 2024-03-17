import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseLineGraph extends StatelessWidget {
  const ExpenseLineGraph({
    required this.spots,
    super.key,
  });

  final List<FlSpot> spots;
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
              spots: spots,
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
