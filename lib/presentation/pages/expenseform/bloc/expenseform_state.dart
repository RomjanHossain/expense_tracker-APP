part of 'expenseform_bloc.dart';

/// {@template expenseform_state}
/// ExpenseformState description
/// {@endtemplate}
class ExpenseformState extends Equatable {
  /// {@macro expenseform_state}
  const ExpenseformState({
    // this.expenseId = '',
    // this.incomeSourceId = '',
    this.isExpense = false,
  });

  /// expense id
  // final String expenseId;

  /// income source id
  // final String incomeSourceId;
  final bool isExpense;

  @override
  List<Object> get props => [
        // expenseId,
        // incomeSourceId,
        isExpense,
      ];

  /// Creates a copy of the current ExpenseformState with property changes
  ExpenseformState copyWith({
    // String? expenseId,
    // String? incomeSourceId,
    bool? isExpense,
  }) {
    return ExpenseformState(
      // expenseId: expenseId ?? this.expenseId,
      // incomeSourceId: incomeSourceId ?? this.incomeSourceId,
      isExpense: isExpense ?? this.isExpense,
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
