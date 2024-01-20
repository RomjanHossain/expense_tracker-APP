import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeLight());

  final SettingsLocalDataSourcePref _settingsLocalDataSourcePref =
      SettingsLocalDataSourcePref();

  ///! get the current theme from shared pref
  FutureOr<void> getTheme() async {
    final theme = await _settingsLocalDataSourcePref.getTheme();
    switch (theme) {
      case 'Light':
        emit(const ThemeLight());
      case 'Dark':
        emit(const ThemeDark());
      case 'System':
        emit(const ThemeSystem());
      default:
        emit(const ThemeLight());
    }
  }

  /// use light theme
  FutureOr<void> useLightTheme() async {
    // if the current state is ThemeLight, do nothing
    if (state is! ThemeLight) {
      emit(const ThemeLight());
      await _settingsLocalDataSourcePref.setTheme('Light');
    }
  }

  // use dark theme
  FutureOr<void> useDarkTheme() async {
    // if the current state is ThemeDark, do nothing
    if (state is! ThemeDark) {
      emit(const ThemeDark());
      await _settingsLocalDataSourcePref.setTheme('Dark');
    }
  }

  // use system theme
  FutureOr<void> useSystemTheme() async {
    // if the current state is ThemeSystem, do nothing
    if (state is! ThemeSystem) {
      emit(const ThemeSystem());
      await _settingsLocalDataSourcePref.setTheme('System');
    }
  }

  // toggle theme
  FutureOr<void> toggleTheme() async {
    // if the current state is ThemeLight, do nothing
    if (state is ThemeLight) {
      emit(const ThemeDark());
      await _settingsLocalDataSourcePref.setTheme('Dark');
    } else if (state is ThemeDark) {
      emit(const ThemeLight());
      await _settingsLocalDataSourcePref.setTheme('Light');
    }
  }
}
