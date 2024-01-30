part of 'currency_cubit.dart';

/// {@template currency}
/// CurrencyState description
/// {@endtemplate}
class CurrencyState extends Equatable {
  /// {@macro currency}
  const CurrencyState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CurrencyState with property changes
  CurrencyState copyWith({
    String? customProperty,
  }) {
    return CurrencyState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template currency_initial}
/// The initial state of CurrencyState
/// {@endtemplate}
class CurrencyInitial extends CurrencyState {
  /// {@macro currency_initial}
  const CurrencyInitial() : super();
}


class CurrencyDollar extends CurrencyState {
  const CurrencyDollar() : super();
}

class CurrencyTaka extends CurrencyState {
  const CurrencyTaka() : super();
}