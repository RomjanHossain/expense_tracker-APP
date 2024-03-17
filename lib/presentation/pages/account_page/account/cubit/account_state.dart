part of 'account_cubit.dart';

/// {@template account}
/// AccountState description
/// {@endtemplate}
class AccountState extends Equatable {
  /// {@macro account}
  const AccountState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AccountState with property changes
  AccountState copyWith({
    String? customProperty,
  }) {
    return AccountState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template account_initial}
/// The initial state of AccountState
/// {@endtemplate}
class AccountInitial extends AccountState {
  /// {@macro account_initial}
  const AccountInitial() : super();
}
