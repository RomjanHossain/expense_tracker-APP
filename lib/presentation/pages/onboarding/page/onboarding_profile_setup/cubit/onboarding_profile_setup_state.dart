part of 'onboarding_profile_setup_cubit.dart';

/// {@template onboarding_profile_setup}
/// OnboardingProfileSetupState description
/// {@endtemplate}
class OnboardingProfileSetupState extends Equatable {
  /// {@macro onboarding_profile_setup}
  const OnboardingProfileSetupState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current OnboardingProfileSetupState with property changes
  OnboardingProfileSetupState copyWith({
    String? customProperty,
  }) {
    return OnboardingProfileSetupState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template onboarding_profile_setup_initial}
/// The initial state of OnboardingProfileSetupState
/// {@endtemplate}
class OnboardingProfileSetupInitial extends OnboardingProfileSetupState {
  /// {@macro onboarding_profile_setup_initial}
  const OnboardingProfileSetupInitial() : super();
}
