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
    this.setupPin = '',
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

  /// setup pin
  final String setupPin;
  @override
  List<Object> get props => [
        pin,
        isFirstTime,
        userPin,
        setupPin,
        attempts,
      ];

  /// Creates a copy of the current OnboardingSetupPinState with property changes
  OnboardingSetupPinState copyWith({
    String? pin,
    bool? isFirstTime,
    String? userPin,
    int? attempts,
    String? setupPin,
  }) {
    return OnboardingSetupPinState(
      pin: pin ?? this.pin,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      userPin: userPin ?? this.userPin,
      setupPin: setupPin ?? this.setupPin,
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
  const OnboardingSetupPinError(this.message) : super();
  final String message;
}

/// success
class OnboardingSetupPinSuccess extends OnboardingSetupPinState {
  const OnboardingSetupPinSuccess() : super();
}
