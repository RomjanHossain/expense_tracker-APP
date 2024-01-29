import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Namespace for the ExpenseTracker [ThemeData].
class ExpenseTrackerTheme {
  /// Standard `ThemeData` for ExpenseTracker UI.
  static ThemeData get standard {
    return ThemeData(
      scaffoldBackgroundColor: ExpenseTrackerColors.light,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ExpenseTrackerColors.violet,
      ),
      // primaryColor: ExpenseTrackerColors.violet,
      // appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      // switch button theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(
          ExpenseTrackerColors.violet,
        ),
        trackColor: MaterialStateProperty.all<Color>(
          ExpenseTrackerColors.violet20,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xfff6f6f6),
      ),
      useMaterial3: true,
    );
  }

  /// DarkTheme `ThemeData` for ExpenseTracker UI.
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: ExpenseTrackerColors.dark,
      dividerTheme: const DividerThemeData(
        color: Color(0xff222222),
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ExpenseTrackerColors.violet,
        brightness: Brightness.dark,
      ),
      // appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      // switch button theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(
          ExpenseTrackerColors.violet,
        ),
        trackColor: MaterialStateProperty.all<Color>(
          ExpenseTrackerColors.violet20,
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: ExpenseTrackerColors.light,
        backgroundColor: ExpenseTrackerColors.violet,
        shape: const RoundedRectangleBorder(
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ExpenseTrackerColors.violet,
        backgroundColor: ExpenseTrackerColors.violet20,
        shape: const RoundedRectangleBorder(
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
        // side: const BorderSide(color: ExpenseTrackerExpenseTrackerColors.white, width: 2),
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }

  /// border radius [small]
  static const borderRadiusSmall = BorderRadius.all(Radius.circular(10));

  /// border radius [medium]
  static const borderRadiusMedium = BorderRadius.all(Radius.circular(16));

  /// border radius [large]
  static const borderRadiusLarge = BorderRadius.all(Radius.circular(20));

  // ignore: comment_references
  /// border radius [extraLarge]
  static const borderRadiusExtraLarge = BorderRadius.all(Radius.circular(30));
}
