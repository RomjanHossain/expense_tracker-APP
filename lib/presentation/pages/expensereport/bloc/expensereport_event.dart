part of 'expensereport_bloc.dart';

abstract class ExpensereportEvent extends Equatable {
  const ExpensereportEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_expensereport_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomExpensereportEvent extends ExpensereportEvent {
  /// {@macro custom_expensereport_event}
  const CustomExpensereportEvent();
}

/// change chat type
class ChangeChartType extends ExpensereportEvent {
  const ChangeChartType(this.chartType);
  final ChartType chartType;
}

/// change the expense type
class ChangeExpenseType extends ExpensereportEvent {
  const ChangeExpenseType(this.etype);
  final ExpenseType2 etype;
}
