part of 'splash_screen_bloc.dart';

/// {@template splash_screen_state}
/// SplashScreenState description
/// {@endtemplate}
class SplashScreenState extends Equatable {
  /// {@macro splash_screen_state}
  const SplashScreenState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current SplashScreenState with property changes
  SplashScreenState copyWith({
    String? customProperty,
  }) {
    return SplashScreenState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template splash_screen_initial}
/// The initial state of SplashScreenState
/// {@endtemplate}
class SplashScreenInitial extends SplashScreenState {
  /// {@macro splash_screen_initial}
  const SplashScreenInitial() : super();
}

// SplashScreenOnboarding
class SplashScreenOnboarding extends SplashScreenState {
  const SplashScreenOnboarding() : super();
}

// SplashScreenSetupProfile
class SplashScreenSetupProfile extends SplashScreenState {
  const SplashScreenSetupProfile() : super();
}

// SplashScreenSetupPin
class SplashScreenSetupPin extends SplashScreenState {
  const SplashScreenSetupPin() : super();
}
