part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_homepage_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomHomepageEvent extends HomepageEvent {
  /// {@macro custom_homepage_event}
  const CustomHomepageEvent();
}

//! NOTE: change the frequency [today,week,month,year]
class ChangeTheFreq extends HomepageEvent {
  const ChangeTheFreq(this.se);
  final SegmentedButtonsData se;
}

// chagne the calander month
class ChangeTheMonth extends HomepageEvent {
  const ChangeTheMonth(this.month);
  final int month;
}
