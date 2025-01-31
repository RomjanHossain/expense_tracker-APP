part of 'budget_bloc.dart';

abstract class BudgetEvent extends Equatable {
  const BudgetEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_budget_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomBudgetEvent extends BudgetEvent {
  /// {@macro custom_budget_event}
  const CustomBudgetEvent();
}

/// change next month
class ChangeNextMonthBudgetEvent extends BudgetEvent {
  const ChangeNextMonthBudgetEvent();
}

/// change to prev month
class ChangePrevMonthBudgetEvent extends BudgetEvent {
  const ChangePrevMonthBudgetEvent();
}

// delete
class DeleteBudgetEvent extends BudgetEvent {
  const DeleteBudgetEvent(this.budget);
  final int budget;
  @override
  List<Object> get props => [budget];
}
