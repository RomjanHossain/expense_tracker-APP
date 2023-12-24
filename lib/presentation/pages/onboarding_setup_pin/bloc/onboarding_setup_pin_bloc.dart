import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'onboarding_setup_pin_event.dart';
part 'onboarding_setup_pin_state.dart';

class OnboardingSetupPinBloc extends Bloc<OnboardingSetupPinEvent, OnboardingSetupPinState> {
  OnboardingSetupPinBloc() : super(const OnboardingSetupPinInitial()) {
    on<CustomOnboardingSetupPinEvent>(_onCustomOnboardingSetupPinEvent);
  }

  FutureOr<void> _onCustomOnboardingSetupPinEvent(
    CustomOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) {
    // TODO: Add Logic
  }
}
