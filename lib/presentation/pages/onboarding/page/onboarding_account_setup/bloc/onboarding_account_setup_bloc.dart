import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'onboarding_account_setup_event.dart';
part 'onboarding_account_setup_state.dart';

class OnboardingAccountSetupBloc extends Bloc<OnboardingAccountSetupEvent, OnboardingAccountSetupState> {
  OnboardingAccountSetupBloc() : super(const OnboardingAccountSetupInitial()) {
    on<CustomOnboardingAccountSetupEvent>(_onCustomOnboardingAccountSetupEvent);
  }

  FutureOr<void> _onCustomOnboardingAccountSetupEvent(
    CustomOnboardingAccountSetupEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) {
    // TODO: Add Logic
  }
}
