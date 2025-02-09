import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseLineGraph extends StatelessWidget {
  const ExpenseLineGraph({
    required this.spots,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    this.expenseSpots,
    this.transferSpots,
    super.key,
  });

  final List<FlSpot> spots;
  final List<FlSpot>? expenseSpots;
  final List<FlSpot>? transferSpots;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
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
          minY: minY,
          maxY: maxY,
          minX: minX,
          maxX: maxX,
          lineBarsData: [
            if (spots.isNotEmpty)
              LineChartBarData(
                spots: spots,
                color: ExpenseTrackerColors.violet,
                isCurved: true,
                barWidth: spots.isEmpty ? 2.0 : 6.h,
                isStrokeCapRound: true,
                dotData: const FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      const Color(0xffCA50FF).withValues(alpha: 0.24),
                      const Color(0xff8B50FF).withValues(alpha: 0),
                    ],
                  ),
                ),
              ),

            // exp
            if (expenseSpots != null)
              LineChartBarData(
                spots: expenseSpots!,
                color: ExpenseTrackerColors.red,
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
                    colors: <Color>[
                      const Color(0xffCA50FF).withValues(alpha: 0.24),
                      const Color(0xff8B50FF).withValues(alpha: 0),
                    ],
                  ),
                ),
              ),

            // trans
            if (transferSpots != null)
              LineChartBarData(
                spots: transferSpots!,
                color: ExpenseTrackerColors.blue,
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
                    colors: <Color>[
                      const Color(0xffCA50FF).withValues(alpha: 0.24),
                      const Color(0xff8B50FF).withValues(alpha: 0),
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
