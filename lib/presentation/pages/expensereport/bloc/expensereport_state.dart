part of 'expensereport_bloc.dart';

/// {@template expensereport_state}
/// ExpensereportState description
/// {@endtemplate}
class ExpensereportState extends Equatable {
  /// {@macro expensereport_state}
  const ExpensereportState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ExpensereportState with property changes
  ExpensereportState copyWith({
    String? customProperty,
  }) {
    return ExpensereportState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template expensereport_initial}
/// The initial state of ExpensereportState
/// {@endtemplate}
class ExpensereportInitial extends ExpensereportState {
  /// {@macro expensereport_initial}
  const ExpensereportInitial() : super();
}
