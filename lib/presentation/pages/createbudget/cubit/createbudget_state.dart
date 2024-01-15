part of 'createbudget_cubit.dart';

/// {@template createbudget}
/// CreatebudgetState description
/// {@endtemplate}
class CreatebudgetState extends Equatable {
  /// {@macro createbudget}
  const CreatebudgetState({
    this.budget = const CreateBudgetEntity(
      amount: 0,
      category: '',
      isReceiveAlert: false,
      percent: 0,
    ),
  });

  /// A description for customProperty
  final CreateBudgetEntity budget;

  @override
  List<Object> get props => [budget];

  /// Creates a copy of the current CreatebudgetState with property changes
  CreatebudgetState copyWith({
    String? cat,bool? isAlert,
    double? ammount,
    double? percent,
  }) {
    return CreatebudgetState(
      budget: budget.copyWith(
        amount: ammount ?? budget.amount,
        category: cat ?? budget.category,
        isReceiveAlert: isAlert ?? budget.isReceiveAlert,
        percent: percent ?? budget.percent,
      ),
    );
  }
}

/// {@template createbudget_initial}
/// The initial state of CreatebudgetState
/// {@endtemplate}
class CreatebudgetInitial extends CreatebudgetState {
  /// {@macro createbudget_initial}
  const CreatebudgetInitial() : super();
  
}
