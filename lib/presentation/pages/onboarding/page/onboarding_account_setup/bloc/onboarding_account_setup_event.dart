part of 'onboarding_account_setup_bloc.dart';

abstract class OnboardingAccountSetupEvent extends Equatable {
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

/// add balance event
class AddBalanceEvent extends OnboardingAccountSetupEvent {
  const AddBalanceEvent(this.balance);
  final double balance;
}

/// add account name event
class AddAccountNameEvent extends OnboardingAccountSetupEvent {
  const AddAccountNameEvent(this.accountName);
  final String accountName;
}

/// add account type event
class AddAccountTypeEvent extends OnboardingAccountSetupEvent {
  const AddAccountTypeEvent(this.accountType);
  final AccountType accountType;
}

/// add account logo
class AddAccountLogoEvent extends OnboardingAccountSetupEvent {
  const AddAccountLogoEvent(this.accountLogo);
  final String accountLogo;
}
