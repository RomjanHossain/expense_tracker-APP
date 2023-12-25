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

// add text
class AddTextOnboardingSetupPinEvent extends OnboardingSetupPinEvent {

  const AddTextOnboardingSetupPinEvent({required this.pin});
  final String pin;
}

// remove text
class RemoveTextOnboardingSetupPinEvent extends OnboardingSetupPinEvent {
  const RemoveTextOnboardingSetupPinEvent();
}

// clear text
class ClearTextOnboardingSetupPinEvent extends OnboardingSetupPinEvent {
  const ClearTextOnboardingSetupPinEvent();
}