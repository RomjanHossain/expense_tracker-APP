import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/domain/entities/create_account_entity/create_account_entity.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/material.dart';
part 'onboarding_account_setup_event.dart';
part 'onboarding_account_setup_state.dart';

class OnboardingAccountSetupBloc
    extends Bloc<OnboardingAccountSetupEvent, OnboardingAccountSetupState> {
  OnboardingAccountSetupBloc() : super(const OnboardingAccountSetupInitial()) {
    on<CustomOnboardingAccountSetupEvent>(_onCustomOnboardingAccountSetupEvent);
    on<AddAccountLogoEvent>(_onAddAccountLogoEvent);
    on<AddAccountNameEvent>(_onAddAccountNameEvent);
    on<AddAccountTypeEvent>(_onAddAccountTypeEvent);
    on<AddBalanceEvent>(_onAddBalanceEvent);
    on<SaveAccountInfoEvent>(_onSaveAccountInfo);
  }

  FutureOr<void> _onAddBalanceEvent(
    AddBalanceEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) {
    emit(
      state.copyWith(
        balance: event.balance,
      ),
    );
  }

  FutureOr<void> _onAddAccountTypeEvent(
    AddAccountTypeEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) {
    debugPrint('Account Type fromEvent: ${event.accountType}');
    debugPrint('Account Type fromState: ${state.createAccount.acType}');
    emit(
      state.copyWith(
        accountType: event.accountType,
      ),
    );
    debugPrint('Account Type fromState: ${state.createAccount.acType}');
  }

  FutureOr<void> _onAddAccountNameEvent(
    AddAccountNameEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) {
    emit(
      state.copyWith(
        accountName: event.accountName,
      ),
    );
  }

  FutureOr<void> _onAddAccountLogoEvent(
    AddAccountLogoEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) {
    emit(
      state.copyWith(
        accountLogo: event.accountLogo,
      ),
    );
  }

  /// save data to db
  FutureOr<void> _onSaveAccountInfo(
    SaveAccountInfoEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) async {
    final isar = IsarInstance();
    // the account schema
    final accountSchema = AccountEntity()
      ..accountName = state.createAccount.acName
      ..accountBalance = state.createAccount.acBalance
      ..accountType = state.createAccount.acType!
      ..accountTypeImg = state.createAccount.acLogo;
    await isar.openAnAccount(accountSchema);
  }

  FutureOr<void> _onCustomOnboardingAccountSetupEvent(
    CustomOnboardingAccountSetupEvent event,
    Emitter<OnboardingAccountSetupState> emit,
  ) {
    // TODO: Add Logic
  }
}
