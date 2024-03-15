import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/homepage_bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/get_flspot_from_iemodel.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/utils_.dart';
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
                  final x = state.todaysIEmodel;
                  switch (state.se) {
                    case SegmentedButtonsData.today:
                      return ExpenseLineGraph(
                        spots: getFlSpotFromIEmodelToday(x),
                        minX: getMinCreatedDateValueFromIEmodel(x),
                        maxX: getMaxCreatedDateValueFromIEmodel(x),
                        minY: getMinAmountValueFromIEmodel(x),
                        maxY: getMaxAmountValueFromIEmodel(x),
                      );
                    case SegmentedButtonsData.week:
                      return ExpenseLineGraph(
                        spots: getFlSpotFromIEmodelToday(x),
                        minX: getMinCreatedDateValueFromIEmodel(x),
                        maxX: getMaxCreatedDateValueFromIEmodel(x),
                        minY: getMinAmountValueFromIEmodel(x),
                        maxY: getMaxAmountValueFromIEmodel(x),
                      );
                    case SegmentedButtonsData.month:
                      return ExpenseLineGraph(
                        spots: getFlSpotFromIEmodelToday(x),
                        minX: getMinCreatedDateValueFromIEmodel(x),
                        maxX: getMaxCreatedDateValueFromIEmodel(x),
                        minY: getMinAmountValueFromIEmodel(x),
                        maxY: getMaxAmountValueFromIEmodel(x),
                      );
                    case SegmentedButtonsData.year:
                      return ExpenseLineGraph(
                        spots: getFlSpotFromIEmodelToday(x),
                        minX: getMinCreatedDateValueFromIEmodel(x),
                        maxX: getMaxCreatedDateValueFromIEmodel(x),
                        minY: getMinAmountValueFromIEmodel(x),
                        maxY: getMaxAmountValueFromIEmodel(x),
                      );
                  }
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
