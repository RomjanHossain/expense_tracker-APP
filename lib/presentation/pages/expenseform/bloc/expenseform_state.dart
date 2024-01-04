part of 'expenseform_bloc.dart';

/// {@template expenseform_state}
/// ExpenseformState description
/// {@endtemplate}
class ExpenseformState extends Equatable {
  /// {@macro expenseform_state}
  const ExpenseformState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ExpenseformState with property changes
  ExpenseformState copyWith({
    String? customProperty,
  }) {
    return ExpenseformState(
      customProperty: customProperty ?? this.customProperty,
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
