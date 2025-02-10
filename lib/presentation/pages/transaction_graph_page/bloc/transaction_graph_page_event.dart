part of 'transaction_graph_page_bloc.dart';

abstract class TransactionGraphPageEvent extends Equatable {
  const TransactionGraphPageEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_transaction_graph_page_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomTransactionGraphPageEvent extends TransactionGraphPageEvent {
  /// {@macro custom_transaction_graph_page_event}
  const CustomTransactionGraphPageEvent();
}

/// change expense type event
class ChangeExpenseTypeEvent extends TransactionGraphPageEvent {
  const ChangeExpenseTypeEvent({
    required this.expenseType,
  });
  final ExpenseType expenseType;
  @override
  List<Object> get props => [expenseType];
}

/// change sort type event
class ChangeSortTypeEvent extends TransactionGraphPageEvent {
  const ChangeSortTypeEvent({
    required this.sortType,
  });
  final SortType sortType;
  @override
  List<Object> get props => [sortType];
}

/// change category event
class ChangeCategoryEvent extends TransactionGraphPageEvent {
  const ChangeCategoryEvent({
    required this.category,
  });
  final CategoryModel category;
  @override
  List<Object> get props => [category];
}

//INFO: init event
class InitTransactionGraphPageEvent extends TransactionGraphPageEvent {
  const InitTransactionGraphPageEvent();
}
