part of 'expenseform_bloc.dart';

/// {@template expenseform_state}
/// ExpenseformState description
/// {@endtemplate}
class ExpenseformState extends Equatable {
  /// {@macro expenseform_state}
  const ExpenseformState({
    // this.expenseId = '',
    // this.incomeSourceId = '',
    this.subStartDay,
    this.subStartMonth,
    this.subEnd,
    this.subType,
    this.isExpense = false,
  });

  /// subscription start date
  final String? subStartMonth;
  final String? subStartDay;

  /// subscription end date
  final DateTime? subEnd;
  // sub type
  final String? subType;
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
    DateTime? subStart,
    DateTime? subEnd,
    String? subType,
    String? subStartDay,
    String? subStartMonth,
  }) {
    return ExpenseformState(
      // expenseId: expenseId ?? this.expenseId,
      // incomeSourceId: incomeSourceId ?? this.incomeSourceId,
      isExpense: isExpense ?? this.isExpense,
      // subStart: subStart ?? this.subStart,
      subEnd: subEnd ?? this.subEnd,
      subType: subType ?? this.subType,
      subStartDay: subStartDay ?? this.subStartDay,
      subStartMonth: subStartMonth ?? this.subStartMonth,
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
