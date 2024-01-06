part of 'expenseform_bloc.dart';

abstract class ExpenseformEvent extends Equatable {
  const ExpenseformEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_expenseform_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomExpenseformEvent extends ExpenseformEvent {
  /// {@macro custom_expenseform_event}
  const CustomExpenseformEvent();
}

// change expense id
class ChangeExpenseId extends ExpenseformEvent {
  const ChangeExpenseId(this.expenseId);
  final String expenseId;

  @override
  List<Object> get props => [expenseId];
}

// change income source id
class ChangeIncomeSourceId extends ExpenseformEvent {
  const ChangeIncomeSourceId(this.incomeSourceId);
  final String incomeSourceId;

  @override
  List<Object> get props => [incomeSourceId];
}

// change repeat
class ChangeRepeat extends ExpenseformEvent {
  // ignore: avoid_positional_boolean_parameters
  const ChangeRepeat(this.isExpense);
  final bool isExpense;

  @override
  List<Object> get props => [isExpense];
}
