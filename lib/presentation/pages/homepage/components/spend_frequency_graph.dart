import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/homepage_bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/get_flspot_from_iemodel.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
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
                  debugPrint('state: ${state.se}');
                  final x = state.se == SegmentedButtonsData.today
                      ? state.todaysIEmodel
                      : state.se == SegmentedButtonsData.week
                          ? state.weeklyIEmodel
                          : state.se == SegmentedButtonsData.month
                              ? state.monthlyIEmodel
                              : state.yearlyIEmodel;
                  final minX = getMinCreatedDateValueFromIEmodel(x, state.se);
                  final maxX = getMaxCreatedDateValueFromIEmodel(x, state.se);
                  final minY = getMinAmountValueFromIEmodel(x);
                  final maxY = getMaxAmountValueFromIEmodel(x);
                  final spots = getFlSpotFromIEmodelToday(x, state.se);
                  debugPrint('minX: $minX , maxX: $maxX');
                  debugPrint('minY: $minY , maxY: $maxY');
                  debugPrint('spots: ${spots.length}');
                  return ExpenseLineGraph(
                    spots: spots,
                    minX: minX,
                    maxX: maxX,
                    minY: minY,
                    maxY: maxY,
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
