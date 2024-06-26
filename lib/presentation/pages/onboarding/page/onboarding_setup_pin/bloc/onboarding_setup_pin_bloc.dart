import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/data/models/isar_entity/user/user_entity_isar.dart';
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
  final isar = IsarInstance();

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
      exit(0);
    } else {
      emit(state.copyWith(attempts: event.attempts));
    }
  }

  /// save pin
  FutureOr<void> _pinSave(
    PinSaveOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) async {
    final isarDB = IsarInstance();
    if (state.userPin.isEmpty) {
      debugPrint('event pin: ${event.pin}');
      final user = UserEntity()..pin = event.pin;
      debugPrint('user pin: ${user.pin}');
      await isar.saveUser(user);
    }
    final ins = await isarDB.instance;
    final totalAccounts = await ins.accountEntitys.count();

    var isHome = false;
    if (totalAccounts > 0) {
      isHome = true;
    }
    emit(
      OnboardingSetupPinSuccess(
        userPP: event.pin,
        isHomePage: isHome,
      ),
    );
  }

  /// init state
  FutureOr<void> _runAtFirst(
    FirstRunOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) async {
    debugPrint('First run event');
    final isarDB = IsarInstance();
    // final isFirstTime = await localPref.isFirstRun();
    // final userPin = await localPref.getUsername();
    final usr = await isarDB.getUser();
    debugPrint('user pin: ${usr?.pin}');
    emit(
      state.copyWith(
        userPin: usr?.pin ?? '',
      ),
    );
  }

  // add text
  FutureOr<void> _onAddTextOnboardingSetupPinEvent(
    AddTextOnboardingSetupPinEvent event,
    Emitter<OnboardingSetupPinState> emit,
  ) {
    final prevPin = state.userPin;
    debugPrint('pin: ${state.pin}');
    if (state.pin.length > 3) {
      debugPrint('pin is more than 4');
      emit(const OnboardingSetupPinError('Pin is more than 4!'));
      emit(state.copyWith(userPin: prevPin));
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
