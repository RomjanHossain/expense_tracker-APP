part of 'onboarding_setup_pin_bloc.dart';

abstract class OnboardingSetupPinEvent  extends Equatable {
  const OnboardingSetupPinEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_onboarding_setup_pin_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomOnboardingSetupPinEvent extends OnboardingSetupPinEvent {
  /// {@macro custom_onboarding_setup_pin_event}
  const CustomOnboardingSetupPinEvent();
}
