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
    // this.todaysIEmodel = const [],
    // this.yesterdaysIEmodel = const [],
    // this.weeklyIEmodel = const [],
    // this.monthlyIEmodel = const [],
    this.yearlyIEmodel = const [],
  });

  /// expense type
  final ExpenseType expenseType;

  /// sorttype
  final SortType sortType;

  /// category
  final List<CategoryModel> categorySelected;

  // /// todays income and expense
  // final List<IEmodel> todaysIEmodel;

  // /// todays yesterday and expense
  // final List<IEmodel> yesterdaysIEmodel;

  // /// week income and expense
  // final List<IEmodel> weeklyIEmodel;

  // /// monthly income and expense
  // final List<IEmodel> monthlyIEmodel;

  /// yearly income and expense
  final List<IEmodel> yearlyIEmodel;

  @override
  List<Object> get props => [
        expenseType,
        sortType,
        categorySelected,
        // todaysIEmodel,
        yearlyIEmodel,
        // weeklyIEmodel,
        // yesterdaysIEmodel,
        // monthlyIEmodel,
      ];

  /// Creates a copy of the current TransactionGraphPageState with property changes
  TransactionGraphPageState copyWith({
    ExpenseType? expenseType,
    SortType? sortType,
    List<CategoryModel>? categorySelected,
    // List<IEmodel>? todaysIEmodel,
    // List<IEmodel>? yesterdaysIEmodel,
    // List<IEmodel>? weeklyIEmodel,
    // List<IEmodel>? monthlyIEmodel,
    List<IEmodel>? yearlyIEmodel,
  }) {
    return TransactionGraphPageState(
      expenseType: expenseType ?? this.expenseType,
      sortType: sortType ?? this.sortType,
      categorySelected: categorySelected ?? this.categorySelected,
      // todaysIEmodel: todaysIEmodel ?? this.todaysIEmodel,
      // yesterdaysIEmodel: yesterdaysIEmodel ?? this.yesterdaysIEmodel,
      // weeklyIEmodel: weeklyIEmodel ?? this.weeklyIEmodel,
      // monthlyIEmodel: monthlyIEmodel ?? this.monthlyIEmodel,
      yearlyIEmodel: yearlyIEmodel ?? this.yearlyIEmodel,
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
