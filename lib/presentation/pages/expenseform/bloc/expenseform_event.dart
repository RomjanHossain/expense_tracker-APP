part of 'expenseform_bloc.dart';

abstract class ExpenseformEvent  extends Equatable {
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
