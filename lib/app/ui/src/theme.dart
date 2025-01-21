import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Namespace for the ExpenseTracker [ThemeData].
class ExpenseTrackerTheme {
  /// Standard `ThemeData` for ExpenseTracker UI.
  static ThemeData get standard {
    return ThemeData(
      fontFamily: 'Inter',
      progressIndicatorTheme: _pogressIndicator,
      primaryColor: ExpenseTrackerColors.violet,
      scaffoldBackgroundColor: ExpenseTrackerColors.light,

      colorScheme: ColorScheme.fromSwatch(
        accentColor: ExpenseTrackerColors.violet,
      ),
      textSelectionTheme: _textSelectionTheme,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ExpenseTrackerColors.violet),
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
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
        thumbColor: WidgetStateProperty.all<Color>(
          ExpenseTrackerColors.violet,
        ),
        trackColor: WidgetStateProperty.all<Color>(
          ExpenseTrackerColors.violet20,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xfff6f6f6),
      ),
      useMaterial3: true,
      dialogTheme: const DialogTheme(
        backgroundColor: ExpenseTrackerColors.light,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
      ),

      listTileTheme: const ListTileThemeData(
        selectedColor: ExpenseTrackerColors.violet,
      ),
      dialogBackgroundColor: ExpenseTrackerColors.light,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ExpenseTrackerColors.violet,
        ),
      ),
      // filterchip data

      chipTheme: _chipTheme,
    );
  }

  /// DarkTheme `ThemeData` for ExpenseTracker UI.
  static ThemeData get darkTheme {
    return ThemeData(
      progressIndicatorTheme: _pogressIndicator,
      scaffoldBackgroundColor: ExpenseTrackerColors.dark,
      textSelectionTheme: _textSelectionTheme,
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
        thumbColor: WidgetStateProperty.all<Color>(
          ExpenseTrackerColors.violet,
        ),
        trackColor: WidgetStateProperty.all<Color>(
          ExpenseTrackerColors.violet20,
        ),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: ExpenseTrackerColors.dark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
        ),
      ),
      dialogBackgroundColor: ExpenseTrackerColors.dark,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ExpenseTrackerColors.violet,
        ),
      ),
      chipTheme: _chipTheme,
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

  /// border radius [small] 10
  static const borderRadiusSmall = BorderRadius.all(Radius.circular(10));

  /// border radius [medium] 16
  static const borderRadiusMedium = BorderRadius.all(Radius.circular(16));

  /// border radius [large] 20
  static const borderRadiusLarge = BorderRadius.all(Radius.circular(20));

  // ignore: comment_references
  /// border radius [extraLarge] 30
  static const borderRadiusExtraLarge = BorderRadius.all(Radius.circular(30));

  ///! [ProgressIndicatorThemeData]
  static ProgressIndicatorThemeData get _pogressIndicator {
    return const ProgressIndicatorThemeData(
      color: ExpenseTrackerColors.violet,
    );
  }

  ///! text selection theme
  static const TextSelectionThemeData _textSelectionTheme =
      TextSelectionThemeData(
    cursorColor: ExpenseTrackerColors.violet,
    selectionColor: ExpenseTrackerColors.violet20,
    selectionHandleColor: ExpenseTrackerColors.violet,
  );

  ///! chip theme
  static final ChipThemeData _chipTheme = ChipThemeData(
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    showCheckmark: false,
    selectedColor: ExpenseTrackerColors.violet20,
    side: const BorderSide(
      color: ExpenseTrackerColors.light40,
    ),
    // round shape
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
