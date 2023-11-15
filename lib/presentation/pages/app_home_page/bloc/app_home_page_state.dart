part of 'app_home_page_bloc.dart';

/// {@template app_home_page_state}
/// AppHomePageState description
/// {@endtemplate}
class AppHomePageState extends Equatable {
  /// {@macro app_home_page_state}
  const AppHomePageState({
    this.currentIndex = 0,
  });

  /// A description for customProperty
  final int currentIndex;

  @override
  List<Object> get props => [
        currentIndex,
      ];

  /// Creates a copy of the current AppHomePageState with property changes
  AppHomePageState copyWith({
    int? changeIndex,
  }) {
    return AppHomePageState(
      currentIndex: changeIndex ?? currentIndex,
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
