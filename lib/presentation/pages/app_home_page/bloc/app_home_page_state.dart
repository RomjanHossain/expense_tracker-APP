part of 'app_home_page_bloc.dart';

/// {@template app_home_page_state}
/// AppHomePageState description
/// {@endtemplate}
class AppHomePageState extends Equatable {
  /// {@macro app_home_page_state}
  const AppHomePageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AppHomePageState with property changes
  AppHomePageState copyWith({
    String? customProperty,
  }) {
    return AppHomePageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template app_home_page_initial}
/// The initial state of AppHomePageState
/// {@endtemplate}
class AppHomePageInitial extends AppHomePageState {
  /// {@macro app_home_page_initial}
  const AppHomePageInitial() : super();
}
