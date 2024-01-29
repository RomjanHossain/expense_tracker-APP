part of 'homepage_bloc.dart';

/// {@template homepage_state}
/// HomepageState description
/// {@endtemplate}
class HomepageState extends Equatable {
  /// {@macro homepage_state}
  const HomepageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current HomepageState with property changes
  HomepageState copyWith({
    String? customProperty,
  }) {
    return HomepageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template homepage_initial}
/// The initial state of HomepageState
/// {@endtemplate}
class HomepageInitial extends HomepageState {
  /// {@macro homepage_initial}
  const HomepageInitial() : super();
}
