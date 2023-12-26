part of 'onboarding_account_setup_bloc.dart';

/// {@template onboarding_account_setup_state}
/// OnboardingAccountSetupState description
/// {@endtemplate}
class OnboardingAccountSetupState extends Equatable {
  /// {@macro onboarding_account_setup_state}
  const OnboardingAccountSetupState({
    this.createAccount=const CreateAccountEntity(
      acName: '',
      acType: AccountType.cash,
      acBalance: 0.0,
      acLogo: '',
    
    ),
  }) ;

  /// A description for createAccount
  final CreateAccountEntity createAccount;

  @override
  List<Object?> get props => [];

  OnboardingAccountSetupState copyWith({
    String? accountName,
    AccountType? accountType,
    double? balance,
    String? accountLogo,
  }) {
    return OnboardingAccountSetupState(
      createAccount: CreateAccountEntity(
        acName: accountName ?? createAccount.acName,
        acType: accountType ?? createAccount.acType,
        acBalance: balance ?? createAccount.acBalance,
        acLogo: accountLogo ?? createAccount.acLogo,
      )
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
