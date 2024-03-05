part of 'transaction_graph_page_bloc.dart';

/// {@template transaction_graph_page_state}
/// TransactionGraphPageState description
/// {@endtemplate}
class TransactionGraphPageState extends Equatable {
  /// {@macro transaction_graph_page_state}
  const TransactionGraphPageState({
    this.expenseType = ExpenseType.income,
    this.sortType = SortType.newest,
    this.categorySelected = const [],
  });

  /// expense type
  final ExpenseType expenseType;

  /// sorttype
  final SortType sortType;

  /// category
  final List<CategoryModel> categorySelected;

  @override
  List<Object> get props => [
        expenseType,
        sortType,
        categorySelected,
      ];

  /// Creates a copy of the current TransactionGraphPageState with property changes
  TransactionGraphPageState copyWith({
    ExpenseType? expenseType,
    SortType? sortType,
    List<CategoryModel>? categorySelected,
  }) {
    return TransactionGraphPageState(
      expenseType: expenseType ?? this.expenseType,
      sortType: sortType ?? this.sortType,
      categorySelected: categorySelected ?? this.categorySelected,
    );
  }
}

/// {@template transaction_graph_page_initial}
/// The initial state of TransactionGraphPageState
/// {@endtemplate}
class TransactionGraphPageInitial extends TransactionGraphPageState {
  /// {@macro transaction_graph_page_initial}
  const TransactionGraphPageInitial() : super();
}
