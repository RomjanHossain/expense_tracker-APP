part of 'expenseform_bloc.dart';

/// {@template expenseform_state}
/// ExpenseformState description
/// {@endtemplate}
class ExpenseformState extends Equatable {
  /// {@macro expenseform_state}
  const ExpenseformState({
    this.accountEntity,
    this.expenseFormEntity = const ExpenseFormEntity(
      isExpense: false,
    ),
  });

  final ExpenseFormEntity expenseFormEntity;
  final Account? accountEntity;

  @override
  List<Object> get props => [
        expenseFormEntity,
      ];

  /// Creates a copy of the current ExpenseformState with property changes
  ExpenseformState copyWith({
    bool? isExpense,
    DateTime? subStart,
    DateTime? subEnd,
    String? subType,
    Account? accountEntity,
  }) {
    return ExpenseformState(
      expenseFormEntity: expenseFormEntity.copyWith(
        isExpense: isExpense ?? expenseFormEntity.isExpense,
        subStart: subStart ?? expenseFormEntity.subStart,
        subEnd: subEnd ?? expenseFormEntity.subEnd,
        subType: subType ?? expenseFormEntity.subType,
      ),
      accountEntity: accountEntity ?? this.accountEntity,
    );
  }
}

class ExpenseformInitial extends ExpenseformState {
  const ExpenseformInitial() : super();
}

//! Successfully added state
class SuccessfullyAddedToDatabase extends ExpenseformState {
  const SuccessfullyAddedToDatabase();
}

//! Failed to add state
class FailedToAddToDatabase extends ExpenseformState {
  const FailedToAddToDatabase();
}
