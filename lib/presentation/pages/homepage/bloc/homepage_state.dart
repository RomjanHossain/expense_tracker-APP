part of 'homepage_bloc.dart';

/// {@template homepage_state}
/// HomepageState description
/// {@endtemplate}
class HomepageState extends Equatable {
  /// {@macro homepage_state}
  const HomepageState({
    this.se = SegmentedButtonsData.today,
    this.notification = 0,
    this.currentMonth = 0,
  });

  /// A description for customProperty
  // final String customProperty;

  /// subscription Enums
  final SegmentedButtonsData se;

  /// notification
  final int notification;

  /// current month
  final int currentMonth;

  /// currentMonth

  @override
  List<Object> get props => [
        notification,
        currentMonth,
        se,
      ];

  /// Creates a copy of the current HomepageState with property changes
  HomepageState copyWith({
    int? notification,
    int? currentMonth,
    SegmentedButtonsData? se,
  }) {
    return HomepageState(
      se: se ?? this.se,
      notification: notification ?? this.notification,
      currentMonth: currentMonth ?? this.currentMonth,
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
