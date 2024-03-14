import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/homepage_bloc.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/constrants/extensions_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendFrequencyGraph extends StatelessWidget {
  const SendFrequencyGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15).h,
              child: Text(
                'Spend Frequency',
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: isDarkMode(context)
                      ? ExpenseTrackerColors.light
                      : ExpenseTrackerColors.dark,
                ),
              ),
            ),
            Expanded(
              child: BlocConsumer<HomepageBloc, HomepageState>(
                builder: (context, state) {
                  return ExpenseLineGraph(
                    spots: [
                      if (state.se == SegmentedButtonsData.today)
                        for (IEmodel i in state.todaysIEmodel)
                          if (i.isIncome == ExpenseType.expense)
                            FlSpot(
                              i.expense!.createdDate!.toDouble,
                              i.expense?.ammount ?? 0,
                            ),
                      if (state.se == SegmentedButtonsData.week)
                        for (IEmodel i in state.weeklyIEmodel)
                          if (i.isIncome == ExpenseType.expense)
                            FlSpot(
                              i.expense!.createdDate!.toDouble,
                              i.expense?.ammount ?? 0,
                            ),

                      if (state.se == SegmentedButtonsData.year)
                        for (IEmodel i in state.yearlyIEmodel)
                          if (i.isIncome == ExpenseType.expense)
                            FlSpot(
                              i.expense!.createdDate!.toDouble,
                              i.expense?.ammount ?? 0,
                            ),
                      if (state.se == SegmentedButtonsData.month)
                        for (IEmodel i in state.monthlyIEmodel)
                          if (i.isIncome == ExpenseType.expense)
                            FlSpot(
                              i.expense!.createdDate!.toDouble,
                              i.expense?.ammount ?? 0,
                            ),
                      // FlSpot(0, 3),
                      // FlSpot(2.6, 2),
                      // FlSpot(4.9, 5),
                      // FlSpot(6.8, 3.1),
                      // FlSpot(8, 4),
                      // FlSpot(9.5, 3),
                      // FlSpot(11, 4),
                    ],
                  );
                },
                listener: (context, state) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
