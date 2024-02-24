part of 'onboarding_setup_pin_bloc.dart';

/// {@template onboarding_setup_pin_state}
/// OnboardingSetupPinState description
/// {@endtemplate}
class OnboardingSetupPinState extends Equatable {
  /// {@macro onboarding_setup_pin_state}
  const OnboardingSetupPinState({
    this.pin = '',
    this.isFirstTime = true,
    this.userPin = '',
    this.attempts = 0,
  });

  /// A description for customProperty
  final String pin;

  /// first time
  final bool isFirstTime;

  /// user pin
  final String userPin;
  /// attempts
  final int attempts;
  @override
  List<Object> get props => [pin, isFirstTime, userPin];

  /// Creates a copy of the current OnboardingSetupPinState with property changes
  OnboardingSetupPinState copyWith({
    String? pin,
    bool? isFirstTime,
    String? userPin,
    int? attempts,
  }) {
    return OnboardingSetupPinState(
      pin: pin ?? this.pin,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      userPin: userPin ?? this.userPin,
      attempts: attempts ?? this.attempts,
    );
  }
}

/// {@template onboarding_setup_pin_initial}
/// The initial state of OnboardingSetupPinState
/// {@endtemplate}
class OnboardingSetupPinInitial extends OnboardingSetupPinState {
  /// {@macro onboarding_setup_pin_initial}
  const OnboardingSetupPinInitial() : super();
}

// error state
class OnboardingSetupPinError extends OnboardingSetupPinState {
  const OnboardingSetupPinError() : super();
}

/// success
class OnboardingSetupPinSuccess extends OnboardingSetupPinState {
  const OnboardingSetupPinSuccess() : super();
}
