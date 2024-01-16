import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeLight());

  /// use light theme
  FutureOr<void> useLightTheme() {
    // if the current state is ThemeLight, do nothing
    if (state is! ThemeLight) {
      emit(const ThemeLight());
    }
  }
  // use dark theme
  FutureOr<void> useDarkTheme() {
    // if the current state is ThemeDark, do nothing
    if (state is! ThemeDark) {
      emit(const ThemeDark());
    }
  }
  // use system theme
  FutureOr<void> useSystemTheme() {
    // if the current state is ThemeSystem, do nothing
    if (state is! ThemeSystem) {
      emit(const ThemeSystem());
    }
  }
}
