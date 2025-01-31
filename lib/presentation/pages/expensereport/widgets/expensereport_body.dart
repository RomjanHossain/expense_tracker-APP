import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/view/expensedetails_page.dart';
import 'package:expense_tracker/presentation/pages/expensereport/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/expensereport/components/chart_below_card.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/card_of_expenses.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/presentation/widgets/charts/pie_carts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template expensereport_body}
/// Body of the ExpensereportPage.
///
/// Add what it does
/// {@endtemplate}
class ExpensereportBody extends StatelessWidget {
  /// {@macro expensereport_body}
  const ExpensereportBody({super.key});

  int getAmount(List<IEmodel> x) {
    return x.fold<double>(0, (a, b) {
      if (b.isIncome == ExpenseType.income) {
        return a + b.income!.amount;
      } else if (b.isIncome == ExpenseType.expense) {
        return a + b.expense!.amount;
      } else {
        return a + b.transfer!.amount;
      }
    }).toInt();
  }

  (List<FlSpot>, List<FlSpot>, List<FlSpot>) getAllSpots(List<IEmodel> data) {
    final a = <FlSpot>[];
    final b = <FlSpot>[];
    final c = <FlSpot>[];
    for (var i = 0; i < data.length; i++) {
      if (data[i].isIncome == ExpenseType.income) {
        a.add(FlSpot(i.toDouble(), data[i].income!.amount));
        b.add(FlSpot(i.toDouble(), 0));
        c.add(FlSpot(i.toDouble(), 0));
      } else if (data[i].isIncome == ExpenseType.expense) {
        b.add(FlSpot(i.toDouble(), data[i].expense!.amount));
        a.add(FlSpot(i.toDouble(), 0));
        c.add(FlSpot(i.toDouble(), 0));
      } else {
        c.add(FlSpot(i.toDouble(), data[i].transfer!.amount));
        a.add(FlSpot(i.toDouble(), 0));
        b.add(FlSpot(i.toDouble(), 0));
      }
    }
    return (a, b, c);
  }

  (double, double, double) getPercenage(List<IEmodel> x) {
    double a = 0;
    double b = 0;
    double c = 0;
    for (var i = 0; i < x.length; i++) {
      if (x[i].isIncome == ExpenseType.income) {
        debugPrint('x[i].income!.amount: ${x[i].income!.amount}');
        a += x[i].income!.amount;
      } else if (x[i].isIncome == ExpenseType.expense) {
        debugPrint('x[i].expense!.amount: ${x[i].expense!.amount}');
        b += x[i].expense!.amount;
      } else {
        debugPrint('x[i].transfer!.amount: ${x[i].transfer!.amount}');
        c += x[i].transfer!.amount;
      }
    }
    debugPrint('a: $a, b: $b, c: $c');
    return (a, b, c);
  }

  double findMax(int a, int b, int c) {
    var max = a; // Initialize max with the first value

    if (b > max) {
      max = b; // Update max if b is greater
    }

    if (c > max) {
      max = c; // Update max if c is greater
    }
    return max.toDouble();
  }

  // list of expenses
  List<IEmodel> getExpenses(List<IEmodel> x) {
    final a = <IEmodel>[];
    for (var i = 0; i < x.length; i++) {
      if (x[i].isIncome == ExpenseType.expense) {
        a.add(x[i]);
      }
    }
    return a;
  }

  // list of incomes
  List<IEmodel> getIncomes(List<IEmodel> x) {
    final a = <IEmodel>[];
    for (var i = 0; i < x.length; i++) {
      if (x[i].isIncome == ExpenseType.income) {
        a.add(x[i]);
      }
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensereportBloc, ExpensereportState>(
      builder: (context, state) {
        final totalAmount = state.frequency == SubscriptionsFrequency.daily
            ? getAmount(state.dailyData)
            : state.frequency == SubscriptionsFrequency.weekly
                ? getAmount(state.weeklyData)
                : state.frequency == SubscriptionsFrequency.monthly
                    ? getAmount(state.monthlyData)
                    : getAmount(state.yearlyData);
        final spots = state.frequency == SubscriptionsFrequency.daily
            ? getAllSpots(state.dailyData)
            : state.frequency == SubscriptionsFrequency.weekly
                ? getAllSpots(state.weeklyData)
                : state.frequency == SubscriptionsFrequency.monthly
                    ? getAllSpots(state.monthlyData)
                    : getAllSpots(state.yearlyData);
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
                      focusColor: isDarkMode(context)
                          ? ExpenseTrackerColors.dark75
                          : ExpenseTrackerColors.light,
                      decoration: dropdownInputDecoration('Frequency'),
                      isExpanded: true,
                      items: SubscriptionsFrequency.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(getSucriptionFrequencyText(e)),
                            ),
                          )
                          .toList(),
                      onChanged: (SubscriptionsFrequency? value) {
                        if (value != null) {
                          context.read<ExpensereportBloc>().add(
                                ChangeFrequency(value),
                              );
                        }
                      },
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
                    onSelectionChanged: (p0) {
                      context
                          .read<ExpensereportBloc>()
                          .add(ChangeChartType(p0.first));
                    },
                    selected: <ChartType>{
                      state.chartType,
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
                  if (state.chartType == ChartType.line)
                    Padding(
                      padding: const EdgeInsets.all(15).h,
                      child: Text(
                        '\$$totalAmount',
                        // r'$ 256.09',
                        style: ExpenseTrackerTextStyle.title2.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                          color: isDarkMode(context)
                              ? ExpenseTrackerColors.light
                              : ExpenseTrackerColors.dark,
                        ),
                      ),
                    ).animate().fadeIn(),
                  if (state.chartType == ChartType.line && spots.$1.isNotEmpty)
                    Expanded(
                      child: ExpenseLineGraph(
                        minX: 0,
                        maxX: findMax(
                          spots.$1.length - 1,
                          spots.$2.length - 1,
                          spots.$3.length - 1,
                        ),
                        minY: 0,
                        // minY: 0,
                        maxY: findMax(
                          spots.$1.length,
                          spots.$2.length,
                          spots.$3.length,
                        ),
                        // maxY: 100,
                        spots: spots.$1,
                        expenseSpots: spots.$2,
                        transferSpots: spots.$3,
                      ),
                    ).animate().fadeIn().shimmer(
                          duration: const Duration(milliseconds: 1500),
                        )
                  else
                    Expanded(
                      child: Stack(
                        children: [
                          ExpensePieGraph(
                            data: [
                              // income
                              PieChartSectionData(
                                color: ExpenseTrackerColors.green,
                                value: state.frequency ==
                                        SubscriptionsFrequency.daily
                                    ? getPercenage(state.dailyData).$1
                                    : state.frequency ==
                                            SubscriptionsFrequency.weekly
                                        ? getPercenage(state.weeklyData).$1
                                        : state.frequency ==
                                                SubscriptionsFrequency.monthly
                                            ? getPercenage(state.monthlyData).$1
                                            : getPercenage(state.yearlyData).$1,
                                radius: 5.r * 4,
                                showTitle: false,
                              ),

                              PieChartSectionData(
                                color: ExpenseTrackerColors.red,
                                value: state.frequency ==
                                        SubscriptionsFrequency.daily
                                    ? getPercenage(state.dailyData).$2
                                    : state.frequency ==
                                            SubscriptionsFrequency.weekly
                                        ? getPercenage(state.weeklyData).$2
                                        : state.frequency ==
                                                SubscriptionsFrequency.monthly
                                            ? getPercenage(state.monthlyData).$2
                                            : getPercenage(state.yearlyData).$2,
                                radius: 5.r * 4,
                                showTitle: false,
                              ),

                              PieChartSectionData(
                                color: ExpenseTrackerColors.blue,
                                value: state.frequency ==
                                        SubscriptionsFrequency.daily
                                    ? getPercenage(state.dailyData).$3
                                    : state.frequency ==
                                            SubscriptionsFrequency.weekly
                                        ? getPercenage(state.weeklyData).$3
                                        : state.frequency ==
                                                SubscriptionsFrequency.monthly
                                            ? getPercenage(state.monthlyData).$3
                                            : getPercenage(state.yearlyData).$3,
                                radius: 5.r * 4,
                                showTitle: false,
                              ),
                            ],
                          ).animate().fadeIn().shimmer(
                                duration: const Duration(milliseconds: 1500),
                              ),
                          Positioned.fill(
                            child: Center(
                              child: Text(
                                '\$$totalAmount',
                                style: ExpenseTrackerTextStyle.title2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                  color: isDarkMode(context)
                                      ? ExpenseTrackerColors.light
                                      : ExpenseTrackerColors.dark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  padding: WidgetStateProperty.all(
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
                selected: <ExpenseType2>{
                  // ExpenseType2.income,
                  state.etype,
                },
                onSelectionChanged: (p0) {
                  context
                      .read<ExpensereportBloc>()
                      .add(ChangeExpenseType(p0.first));
                },
              ),
            ),
            if (state.chartType == ChartType.line &&
                state.etype == ExpenseType2.expense)
              Column(
                children: getExpenses(
                  state.frequency == SubscriptionsFrequency.daily
                      ? state.dailyData
                      : state.frequency == SubscriptionsFrequency.weekly
                          ? state.weeklyData
                          : state.frequency == SubscriptionsFrequency.monthly
                              ? state.monthlyData
                              : state.yearlyData,
                )
                    .map(
                      (currentItem) => GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          ExpensedetailsPage.route(currentItem),
                        ),
                        child: CardOfExpense2(cardOfExpense: currentItem),
                      ),
                    )
                    .toList(),
              ),
            if (state.chartType == ChartType.line &&
                state.etype == ExpenseType2.income)
              Column(
                children: getIncomes(
                  state.frequency == SubscriptionsFrequency.daily
                      ? state.dailyData
                      : state.frequency == SubscriptionsFrequency.weekly
                          ? state.weeklyData
                          : state.frequency == SubscriptionsFrequency.monthly
                              ? state.monthlyData
                              : state.yearlyData,
                )
                    .map(
                      (currentItem) => GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          ExpensedetailsPage.route(currentItem),
                        ),
                        child: CardOfExpense2(cardOfExpense: currentItem),
                      ),
                    )
                    .toList(),
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
          ],
        );
      },
    );
  }
}
