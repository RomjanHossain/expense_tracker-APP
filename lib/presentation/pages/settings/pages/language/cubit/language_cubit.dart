import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:expense_tracker/l10n/l10n.dart';
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
        // await AppLocalizations.delegate.load(const Locale('bn'));
        emit(const LanguageBangla());
      case 'English':
        // await AppLocalizations.delegate.load(const Locale('en'));
        emit(const LanguageEnglish());
      default:
        // await AppLocalizations.delegate.load(const Locale('en'));
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
