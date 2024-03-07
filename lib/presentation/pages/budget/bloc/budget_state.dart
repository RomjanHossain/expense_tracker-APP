part of 'budget_bloc.dart';

/// {@template budget_state}
/// BudgetState description
/// {@endtemplate}
class BudgetState extends Equatable {
  /// {@macro budget_state}
  const BudgetState({
    this.currentMon = 0,
  });

  /// A description for customProperty
  final int currentMon;

  @override
  List<Object> get props => [currentMon];

  /// Creates a copy of the current BudgetState with property changes
  BudgetState copyWith({
    int? currentMon,
  }) {
    return BudgetState(
      currentMon: currentMon ?? this.currentMon,
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
