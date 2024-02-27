import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:flutter/material.dart';
part 'onboarding_setup_pin_event.dart';
part 'onboarding_setup_pin_state.dart';

class OnboardingSetupPinBloc
    extends Bloc<OnboardingSetupPinEvent, OnboardingSetupPinState> {
  OnboardingSetupPinBloc() : super(const OnboardingSetupPinInitial()) {
    on<AddTextOnboardingSetupPinEvent>(_onAddTextOnboardingSetupPinEvent);
    on<RemoveTextOnboardingSetupPinEvent>(_onRemoveTextOnboardingSetupPinEvent);
    on<ClearTextOnboardingSetupPinEvent>(_onClearTextOnboardingSetupPinEvent);
    on<FirstRunOnboardingSetupPinEvent>(_runAtFirst);
    on<PinSaveOnboardingSetupPinEvent>(_pinSave);
    on<ChangeAttemptsOnboardingSetupPinEvent>(_changeAttempts);
    on<SaveFirstAttemptsPinOnboardingSetupPinEvent>(_saveFirstAttempts);
  }

  /// save first attempts pin
  FutureOr<void> _saveFirstAttempts(
    SaveFirstAttemptsPinOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) async {
    emit(
      state.copyWith(
        setupPin: event.pin,
        attempts: state.attempts + 1,
      ),
    );
  }

  /// change attempts
  FutureOr<void> _changeAttempts(
    ChangeAttemptsOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) async {
    // attempt to change pin is 3
    if (event.attempts == 3) {
      emit(const OnboardingSetupPinError('Too many Attempts!'));
      emit(const OnboardingSetupPinInitial());
    } else {
      emit(state.copyWith(attempts: event.attempts));
    }
  }

  /// save pin
  FutureOr<void> _pinSave(
    PinSaveOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) async {
    final localPref = SettingsLocalDataSourcePref();
    await localPref.setupPin(event.pin);
    emit(const OnboardingSetupPinSuccess());
  }

  /// init state
  FutureOr<void> _runAtFirst(
    FirstRunOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) async {
    final localPref = SettingsLocalDataSourcePref();
    // final isFirstTime = await localPref.isFirstRun();
    final userPin = await localPref.getPin();
    emit(
      state.copyWith(
        // isFirstTime: isFirstTime,
        userPin: userPin,
      ),
    );
  }

  // add text
  FutureOr<void> _onAddTextOnboardingSetupPinEvent(
    AddTextOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) {
    debugPrint('pin: ${state.pin}');
    if (state.pin.length > 3) {
      debugPrint('pin is more than 4');
      emit(const OnboardingSetupPinError('Pin is more than 4!'));
      emit(const OnboardingSetupPinInitial());
    } else {
      debugPrint('pin is less than 4');
      emit(state.copyWith(pin: state.pin + event.pin));
    }
  }

  // remove text
  FutureOr<void> _onRemoveTextOnboardingSetupPinEvent(
    RemoveTextOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) {
    emit(state.copyWith(pin: state.pin.substring(0, state.pin.length - 1)));
  }

  // clear text
  FutureOr<void> _onClearTextOnboardingSetupPinEvent(
    ClearTextOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) {
    emit(state.copyWith(pin: ''));
  }
}
