part of 'onboarding_setup_pin_bloc.dart';

/// {@template onboarding_setup_pin_state}
/// OnboardingSetupPinState description
/// {@endtemplate}
class OnboardingSetupPinState extends Equatable {
  /// {@macro onboarding_setup_pin_state}
  const OnboardingSetupPinState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current OnboardingSetupPinState with property changes
  OnboardingSetupPinState copyWith({
    String? customProperty,
  }) {
    return OnboardingSetupPinState(
      customProperty: customProperty ?? this.customProperty,
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
