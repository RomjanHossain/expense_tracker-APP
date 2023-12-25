part of 'onboarding_account_setup_bloc.dart';

abstract class OnboardingAccountSetupEvent  extends Equatable {
  const OnboardingAccountSetupEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_onboarding_account_setup_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomOnboardingAccountSetupEvent extends OnboardingAccountSetupEvent {
  /// {@macro custom_onboarding_account_setup_event}
  const CustomOnboardingAccountSetupEvent();
}
