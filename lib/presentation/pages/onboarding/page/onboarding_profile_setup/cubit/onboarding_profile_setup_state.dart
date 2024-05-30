part of 'onboarding_profile_setup_cubit.dart';

/// {@template onboarding_profile_setup}
/// OnboardingProfileSetupState description
/// {@endtemplate}
class OnboardingProfileSetupState extends Equatable {
  /// {@macro onboarding_profile_setup}
  const OnboardingProfileSetupState({
    this.name = 'default',
    this.image,
  });

  /// A description for customProperty
  final String name;
  // final image
  final Uint8List? image;

  @override
  List<Object> get props => [
        name,
      ];

  /// Creates a copy of the current OnboardingProfileSetupState with property changes
  OnboardingProfileSetupState copyWith({
    String? name,
    Uint8List? image,
  }) {
    return OnboardingProfileSetupState(
      name: name ?? this.name,
      image: image ?? this.image,
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

/// loading state
class OnboardingProfileSetupLoading extends OnboardingProfileSetupState {
  /// {@macro onboarding_profile_setup_loading}
  const OnboardingProfileSetupLoading() : super();
}

/// success state
class OnboardingProfileSetupSuccess extends OnboardingProfileSetupState {
  /// {@macro onboarding_profile_setup_success}
  const OnboardingProfileSetupSuccess() : super();
}

/// error state
class OnboardingProfileSetupError extends OnboardingProfileSetupState {
  /// {@macro onboarding_profile_setup_error}
  const OnboardingProfileSetupError() : super();
}
