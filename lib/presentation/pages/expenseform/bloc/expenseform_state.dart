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
  final AccountEntity? accountEntity;

  @override
  List<Object> get props => [
        expenseFormEntity,
      ];

  /// Creates a copy of the current ExpenseformState with property changes
  ExpenseformState copyWith({
    // String? expenseId,
    // String? incomeSourceId,
    bool? isExpense,
    DateTime? subStart,
    DateTime? subEnd,
    String? subType,
    AccountEntity? accountEntity,
    // String? subStartDa,
    // String? subStartMonth,
  }) {
    return ExpenseformState(
      // expenseId: expenseId ?? this.expenseId,
      // incomeSourceId: incomeSourceId ?? this.incomeSourceId,
      // isExpense: isExpense ?? this.isExpense,
      // // subStart: subStart ?? this.subStart,
      // subEnd: subEnd ?? this.subEnd,
      // subType: subType ?? this.subType,
      // subStartDay: subStartDay ?? this.subStartDay,
      // subStartMonth: subStartMonth ?? this.subStartMonth,
      expenseFormEntity: expenseFormEntity.copyWith(
        isExpense: isExpense ?? expenseFormEntity.isExpense,
        subStart: subStart ?? expenseFormEntity.subStart,
        subEnd: subEnd ?? expenseFormEntity.subEnd,
        subType: subType ?? expenseFormEntity.subType,
        // subStartDay: subStartDay ?? expenseFormEntity.subStartDay,
        // subStartMonth: subStartMonth ?? expenseFormEntity.subStartMonth,
      ),
      accountEntity: accountEntity ?? this.accountEntity,
    );
  }
}

/// {@template expenseform_initial}
/// The initial state of ExpenseformState
/// {@endtemplate}
class ExpenseformInitial extends ExpenseformState {
  /// {@macro expenseform_initial}
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
