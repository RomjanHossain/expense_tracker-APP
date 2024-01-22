import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageInitial());
  final SettingsLocalDataSourcePref _settingsLocalDataSourcePref =
      SettingsLocalDataSourcePref();

  // get the current language from shared pref
  FutureOr<void> getLanguage() async {
    final language = await _settingsLocalDataSourcePref.getLanguage();
    switch (language) {
      case 'Bangla':
        emit(const LanguageBangla());
      case 'English':
        emit(const LanguageEnglish());
      default:
        emit(const LanguageEnglish());
    }
  }

  // use bangla language
  FutureOr<void> useBanglaLanguage() async {
    // if the current state is LanguageBangla, do nothing
    if (state is! LanguageBangla) {
      emit(const LanguageBangla());
      await _settingsLocalDataSourcePref.setLanguage('Bangla');
    }
  }

  // use english language
  FutureOr<void> useEnglishLanguage() async {
    // if the current state is LanguageEnglish, do nothing
    if (state is! LanguageEnglish) {
      emit(const LanguageEnglish());
      await _settingsLocalDataSourcePref.setLanguage('English');
    }
  }
}
