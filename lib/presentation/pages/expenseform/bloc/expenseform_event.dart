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

// change subscription start date
class ChangeSubStart extends ExpenseformEvent {
  const ChangeSubStart(this.subStart);
  final DateTime subStart;

  @override
  List<Object> get props => [subStart];
}

// change subscription start month
class ChangeSubStartMonth extends ExpenseformEvent {
  const ChangeSubStartMonth(this.subStartMonth);
  final String subStartMonth;

  @override
  List<Object> get props => [subStartMonth];
}

// change subscription end date
class ChangeSubEnd extends ExpenseformEvent {
  const ChangeSubEnd(this.subEnd);
  final DateTime subEnd;

  @override
  List<Object> get props => [subEnd];
}

// change subscription type
class ChangeSubType extends ExpenseformEvent {
  const ChangeSubType(this.subType);
  final String subType;

  @override
  List<Object> get props => [subType];
}

// change repeat
class ChangeRepeat extends ExpenseformEvent {
  // ignore: avoid_positional_boolean_parameters
  const ChangeRepeat(this.isExpense);
  final bool isExpense;

  @override
  List<Object> get props => [isExpense];
}

//NOTE: change the account entity
class ChangeAccountEntity extends ExpenseformEvent {
  const ChangeAccountEntity(this.accountEntity);
  final Account accountEntity;
  @override
  List<Object> get props => [accountEntity];
}

class ResetExpenseForm extends ExpenseformEvent {}

//! NOTE: transfer event
class TransferToDatbase extends ExpenseformEvent {
  const TransferToDatbase(this.transferAmount);
  final TransfersCompanion transferAmount;
  @override
  List<Object> get props => [transferAmount];
}

//! NOTE: expense event
class ExpenseToDatabase extends ExpenseformEvent {
  const ExpenseToDatabase(this.expenseAmount);
  final ExpensesCompanion expenseAmount;
  @override
  List<Object> get props => [expenseAmount];
}

/// income event
class IncomeToDatabase extends ExpenseformEvent {
  const IncomeToDatabase(this.incomeAmount);
  final IncomesCompanion incomeAmount;
  @override
  List<Object> get props => [incomeAmount];
}
