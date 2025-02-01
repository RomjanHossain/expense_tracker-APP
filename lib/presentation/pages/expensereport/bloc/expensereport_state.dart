part of 'expensereport_bloc.dart';

/// {@template expensereport_state}
/// ExpensereportState description
/// {@endtemplate}
class ExpensereportState extends Equatable {
  /// {@macro expensereport_state}
  const ExpensereportState({
    this.dailyData = const [],
    this.weeklyData = const [],
    this.yearlyData = const [],
    this.monthlyData = const [],
    this.chartType = ChartType.line,
    this.etype = ExpenseType2.expense,
    this.frequency = SubscriptionsFrequency.daily,
  });

  /// Expense type
  final ExpenseType2 etype;

  /// chart
  final ChartType chartType;
  // freqeuncy
  final SubscriptionsFrequency frequency;
  // iemodel
  final List<IEmodel> dailyData;
  final List<IEmodel> weeklyData;
  final List<IEmodel> monthlyData;
  final List<IEmodel> yearlyData;

  @override
  List<Object> get props => [
        etype,
        chartType,
        dailyData,
        weeklyData,
        monthlyData,
        yearlyData,
        frequency,
      ];

  /// Creates a copy of the current ExpensereportState with property changes
  ExpensereportState copyWith({
    ChartType? chartType,
    ExpenseType2? etype,
    List<IEmodel>? dailyData,
    List<IEmodel>? weeklyData,
    List<IEmodel>? monthlyData,
    List<IEmodel>? yearlyData,
    SubscriptionsFrequency? frequency,
  }) {
    return ExpensereportState(
      etype: etype ?? this.etype,
      chartType: chartType ?? this.chartType,
      dailyData: dailyData ?? this.dailyData,
      weeklyData: weeklyData ?? this.weeklyData,
      monthlyData: monthlyData ?? this.monthlyData,
      yearlyData: yearlyData ?? this.yearlyData,
      frequency: frequency ?? this.frequency,
    );
  }
}

/// {@template expensereport_initial}
/// The initial state of ExpensereportState
/// {@endtemplate}
class ExpensereportInitial extends ExpensereportState {
  /// {@macro expensereport_initial}
  const ExpensereportInitial() : super();
}
