part of 'budget_bloc.dart';

/// {@template budget_state}
/// BudgetState description
/// {@endtemplate}
class BudgetState extends Equatable {
  /// {@macro budget_state}
  const BudgetState({
    this.currentMon = 0,
    this.budgetList = const [],
  });

  /// A description for customProperty
  final int currentMon;
  // list of budegt
  final List<Budget> budgetList;

  @override
  List<Object> get props => [currentMon, budgetList];

  /// Creates a copy of the current BudgetState with property changes
  BudgetState copyWith({
    int? currentMon,
    List<Budget>? budgetList,
  }) {
    return BudgetState(
      currentMon: currentMon ?? this.currentMon,
      budgetList: budgetList ?? this.budgetList,
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
