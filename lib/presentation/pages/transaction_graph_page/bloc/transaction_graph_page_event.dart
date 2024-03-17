part of 'transaction_graph_page_bloc.dart';

abstract class TransactionGraphPageEvent  extends Equatable {
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
