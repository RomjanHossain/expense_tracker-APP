part of 'homepage_bloc.dart';

abstract class HomepageEvent  extends Equatable {
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
