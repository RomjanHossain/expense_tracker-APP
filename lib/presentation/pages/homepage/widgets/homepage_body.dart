import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/app_bar_sliver.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/segmented_button_wid.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/spend_frequency_graph.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template homepage_body}
/// Body of the HomepagePage.
///
/// Add what it does
/// {@endtemplate}
class HomepageBody extends StatelessWidget {
  /// {@macro homepage_body}
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageBloc, HomepageState>(
      builder: (context, HomepageState state) {
        final width = MediaQuery.sizeOf(context).width;
        return CustomScrollView(
          slivers: [
            //!INFO: app bar
            const AccountBalanceSliverAppBar(),
            //NOTE: a graph for showing todays expense
            const SendFrequencyGraph(),

            ///* segmented buttons
            const SliverToBoxAdapter(
              child: HomeSegmentedButtonsWidget(),
            ),

            /// * recent transactions
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 15.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: ExpenseTrackerTextStyle.title3.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 19.sp,
                        color: isDarkMode(context)
                            ? ExpenseTrackerColors.light
                            : ExpenseTrackerColors.dark,
                      ),
                    ),
                    FilledButton.tonal(
                      style: ButtonStyle(
                        // minimumSize: MaterialStateProperty.all(
                        //   Size(20.w, 40.h),
                        // ),
                        backgroundColor: WidgetStateProperty.all(
                          ExpenseTrackerColors.violet20,
                        ),
                        side: WidgetStateProperty.all(
                          BorderSide.none,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        width > 260 ? 'see all' : '...',
                        style: ExpenseTrackerTextStyle.body3.copyWith(
                          color: ExpenseTrackerColors.violet,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //NOTE: list of transactions
            SliverList.builder(
              itemCount: state.se == SegmentedButtonsData.today
                  ? state.todaysIEmodel.length
                  : state.se == SegmentedButtonsData.week
                      ? state.weeklyIEmodel.length
                      : state.se == SegmentedButtonsData.year
                          ? state.yearlyIEmodel.length
                          : state.monthlyIEmodel.length,
              itemBuilder: (context, index) {
                debugPrint(
                  'Lenght: ${state.se == SegmentedButtonsData.today ? state.todaysIEmodel.length : state.se == SegmentedButtonsData.week ? state.weeklyIEmodel.length : state.se == SegmentedButtonsData.year ? state.yearlyIEmodel.length : state.monthlyIEmodel.length}',
                );
                final currentItem = state.se == SegmentedButtonsData.today
                    ? state.todaysIEmodel.elementAt(index)
                    : state.se == SegmentedButtonsData.week
                        ? state.weeklyIEmodel.elementAt(index)
                        : state.se == SegmentedButtonsData.year
                            ? state.yearlyIEmodel.elementAt(index)
                            : state.monthlyIEmodel.elementAt(index);
                return CardOfExpense2(
                  cardOfExpense: currentItem,
                );
              },
            ),
          ],
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
