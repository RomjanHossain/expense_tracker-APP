import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/domain/entities/card_of_expense/card_of_expense_entity.dart';
import 'package:expense_tracker/presentation/pages/expenseform/widgets/expenseform_body.dart';
import 'package:expense_tracker/presentation/pages/expensereport/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expensereport/components/chart_below_card.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expense.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/presentation/widgets/charts/pie_carts.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template expensereport_body}
/// Body of the ExpensereportPage.
///
/// Add what it does
/// {@endtemplate}
class ExpensereportBody extends StatelessWidget {
  /// {@macro expensereport_body}
  const ExpensereportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensereportBloc, ExpensereportState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButtonFormField(
                      // hint: Text('Frequency'),
                      focusColor: ExpenseTrackerColors.light,
                      decoration: dropdownInputDecoration('Frequency').copyWith(
                        fillColor: ExpenseTrackerColors.light,
                      ),
                      isExpanded: true,
                      items: subscriptionsFrequency
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  const Spacer(),
                  SegmentedButton<ChartType>(
                    showSelectedIcon: false,
                    segments: const <ButtonSegment<ChartType>>[
                      ButtonSegment<ChartType>(
                        // label: Text('Line'),
                        icon: Icon(Icons.show_chart),
                        value: ChartType.line,
                      ),
                      ButtonSegment<ChartType>(
                        // label: Text('Pie'),
                        icon: Icon(Icons.pie_chart),
                        value: ChartType.pie,
                      ),
                    ],
                    selected: const <ChartType>{
                      ChartType.line,
                    },
                  ),
                ],
              ),
            ),
            // graphs
            SizedBox(
              height: 240.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15).h,
                    child: Text(
                      r'$ 256.09',
                      style: ExpenseTrackerTextStyle.title2.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: theme.brightness == Brightness.light
                            ? ExpenseTrackerColors.dark
                            : ExpenseTrackerColors.light,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: ExpenseLineGraph(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.9, 5),
                        FlSpot(6.8, 3.1),
                        FlSpot(8, 4),
                        FlSpot(9.5, 3),
                        FlSpot(11, 4),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      ExpensePieGraph(
                        pieRadius: 5.r * 4,
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            r'$3245',
                            style: ExpenseTrackerTextStyle.title2.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              color: theme.brightness == Brightness.light
                                  ? ExpenseTrackerColors.dark
                                  : ExpenseTrackerColors.light,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            // segmented buttons (expenses, income)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 20.h,
              ),
              child: SegmentedButton<ExpenseType2>(
                showSelectedIcon: false,
                style: ButtonStyle(
                  // inner padding
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                  ),
                ),
                segments: const <ButtonSegment<ExpenseType2>>[
                  ButtonSegment<ExpenseType2>(
                    label: Text('Expense'),
                    value: ExpenseType2.expense,
                  ),
                  ButtonSegment<ExpenseType2>(
                    label: Text('Income'),
                    value: ExpenseType2.income,
                  ),
                ],
                selected: const <ExpenseType2>{
                  ExpenseType2.income,
                },
              ),
            ),
            // for pie
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: PieChartBelowDataComponent(
                    amount: -1 + index.toDouble(),
                    color: ExpenseTrackerColors.blue60,
                    title: 'householdRepairs',
                  ),
                );
              },
            ),
            // t
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const CardOfExpense(
                  cardOfExpense: CardOfExpenseEntity(
                    color: ExpenseTrackerColors.violet,
                    title: 'householdRepairs',
                    subtitle: 'Walmart',
                    amount: 23,
                    date: 'Today',
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
