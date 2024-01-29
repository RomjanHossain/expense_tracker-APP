part of 'expenseform_bloc.dart';

/// {@template expenseform_state}
/// ExpenseformState description
/// {@endtemplate}
class ExpenseformState extends Equatable {
  /// {@macro expenseform_state}
  const ExpenseformState({
    this.expenseFormEntity = const ExpenseFormEntity(
      // expenseId: '',
      // incomeSourceId: '',
      isExpense: false,
      // subStart: DateTime.now(),
      // subEnd: DateTime.now(),
      // subStartDay: '1',
      // subStartMonth: 'January',
    ),
  });

  final ExpenseFormEntity expenseFormEntity;

  @override
  List<Object> get props => [
        // expenseId,
        // incomeSourceId,
        // isExpense,
        expenseFormEntity,
        // subStartDay!,
        // subStartMonth!,
        // subEnd!,
        // subType!,
      ];

  /// Creates a copy of the current ExpenseformState with property changes
  ExpenseformState copyWith({
    // String? expenseId,
    // String? incomeSourceId,
    bool? isExpense,
    DateTime? subStart,
    DateTime? subEnd,
    String? subType,
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
