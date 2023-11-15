part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent  extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_splash_screen_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomSplashScreenEvent extends SplashScreenEvent {
  /// {@macro custom_splash_screen_event}
  const CustomSplashScreenEvent();
}
