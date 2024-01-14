part of 'expensedetails_cubit.dart';

/// {@template expensedetails}
/// ExpensedetailsState description
/// {@endtemplate}
class ExpensedetailsState extends Equatable {
  /// {@macro expensedetails}
  const ExpensedetailsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ExpensedetailsState with property changes
  ExpensedetailsState copyWith({
    String? customProperty,
  }) {
    return ExpensedetailsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template expensedetails_initial}
/// The initial state of ExpensedetailsState
/// {@endtemplate}
class ExpensedetailsInitial extends ExpensedetailsState {
  /// {@macro expensedetails_initial}
  const ExpensedetailsInitial() : super();
}
