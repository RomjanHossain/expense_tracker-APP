part of 'account_detail_cubit.dart';

/// {@template account_detail}
/// AccountDetailState description
/// {@endtemplate}
class AccountDetailState extends Equatable {
  /// {@macro account_detail}
  const AccountDetailState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AccountDetailState with property changes
  AccountDetailState copyWith({
    String? customProperty,
  }) {
    return AccountDetailState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template account_detail_initial}
/// The initial state of AccountDetailState
/// {@endtemplate}
class AccountDetailInitial extends AccountDetailState {
  /// {@macro account_detail_initial}
  const AccountDetailInitial() : super();
}
