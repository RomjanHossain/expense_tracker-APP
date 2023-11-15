part of 'transaction_graph_page_bloc.dart';

/// {@template transaction_graph_page_state}
/// TransactionGraphPageState description
/// {@endtemplate}
class TransactionGraphPageState extends Equatable {
  /// {@macro transaction_graph_page_state}
  const TransactionGraphPageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current TransactionGraphPageState with property changes
  TransactionGraphPageState copyWith({
    String? customProperty,
  }) {
    return TransactionGraphPageState(
      customProperty: customProperty ?? this.customProperty,
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
