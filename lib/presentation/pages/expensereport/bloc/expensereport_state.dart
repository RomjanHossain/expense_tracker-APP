part of 'expensereport_bloc.dart';

/// {@template expensereport_state}
/// ExpensereportState description
/// {@endtemplate}
class ExpensereportState extends Equatable {
  /// {@macro expensereport_state}
  const ExpensereportState({
    this.chartType = ChartType.line,
    this.etype = ExpenseType2.expense,
  });

  /// Expense type
  final ExpenseType2 etype;

  /// chart
  final ChartType chartType;

  @override
  List<Object> get props => [etype, chartType];

  /// Creates a copy of the current ExpensereportState with property changes
  ExpensereportState copyWith({
    ChartType? chartType,
    ExpenseType2? etype,
  }) {
    return ExpensereportState(
      etype: etype ?? this.etype,
      chartType: chartType ?? this.chartType,
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
