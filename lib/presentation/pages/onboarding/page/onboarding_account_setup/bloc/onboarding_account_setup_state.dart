part of 'onboarding_account_setup_bloc.dart';

/// {@template onboarding_account_setup_state}
/// OnboardingAccountSetupState description
/// {@endtemplate}
class OnboardingAccountSetupState extends Equatable {
  /// {@macro onboarding_account_setup_state}
  const OnboardingAccountSetupState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current OnboardingAccountSetupState with property changes
  OnboardingAccountSetupState copyWith({
    String? customProperty,
  }) {
    return OnboardingAccountSetupState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template onboarding_account_setup_initial}
/// The initial state of OnboardingAccountSetupState
/// {@endtemplate}
class OnboardingAccountSetupInitial extends OnboardingAccountSetupState {
  /// {@macro onboarding_account_setup_initial}
  const OnboardingAccountSetupInitial() : super();
}
