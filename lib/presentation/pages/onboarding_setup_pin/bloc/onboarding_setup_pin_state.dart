part of 'onboarding_setup_pin_bloc.dart';

/// {@template onboarding_setup_pin_state}
/// OnboardingSetupPinState description
/// {@endtemplate}
class OnboardingSetupPinState extends Equatable {
  /// {@macro onboarding_setup_pin_state}
  const OnboardingSetupPinState({
    this.pin = '',
  });

  /// A description for customProperty
  final String pin;

  @override
  List<Object> get props => [pin];

  /// Creates a copy of the current OnboardingSetupPinState with property changes
  OnboardingSetupPinState copyWith({
    String? pin,
  }) {
    return OnboardingSetupPinState(
      pin: pin ?? this.pin,
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
