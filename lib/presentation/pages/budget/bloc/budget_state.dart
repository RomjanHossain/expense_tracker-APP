part of 'budget_bloc.dart';

/// {@template budget_state}
/// BudgetState description
/// {@endtemplate}
class BudgetState extends Equatable {
  /// {@macro budget_state}
  const BudgetState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current BudgetState with property changes
  BudgetState copyWith({
    String? customProperty,
  }) {
    return BudgetState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template budget_initial}
/// The initial state of BudgetState
/// {@endtemplate}
class BudgetInitial extends BudgetState {
  /// {@macro budget_initial}
  const BudgetInitial() : super();
}
