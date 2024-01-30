import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(const CurrencyInitial());
  final SettingsLocalDataSourcePref _settingsLocalDataSourcePref =
      SettingsLocalDataSourcePref();
  ///! get the current currency
  Future<void> getCurrentCurrency() async {
    final currency = await _settingsLocalDataSourcePref.getCurrency();
    switch (currency) {
      case r'$':
        emit(const CurrencyDollar());
      case '৳':
        emit(const CurrencyTaka());
      default:
        emit(const CurrencyDollar());
    }
  }
  ///! use dollar currency
  Future<void> useDollarCurrency() async {
    await _settingsLocalDataSourcePref.setCurrency(r'$');
    emit(const CurrencyDollar());
  }
  ///! use taka currency
  Future<void> useTakaCurrency() async {
    await _settingsLocalDataSourcePref.setCurrency('৳');
    emit(const CurrencyTaka());
  }
}
