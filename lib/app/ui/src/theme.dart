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
      // appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      // switch button theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(
          ExpenseTrackerColors.violet,
        ),
        trackColor: MaterialStateProperty.all<Color>(
          ExpenseTrackerColors.violet20,
        ),
      ),
      useMaterial3: true,
    );
  }

  /// DarkTheme `ThemeData` for ExpenseTracker UI.
  static ThemeData get darkTheme {
    return ThemeData(
      // scaffoldBackgroundColor: ExpenseTrackerColors.darkBackground,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: ExpenseTrackerColors.violet,
        brightness: Brightness.dark,
      ),
      // appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
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

  // /// `ThemeData` for ExpenseTracker UI for small screens.
  // static ThemeData get small {
  //   return standard.copyWith(textTheme: _smallTextTheme);
  // }

  // /// `ThemeData` for ExpenseTracker UI for medium screens.
  // static ThemeData get medium {
  //   return standard.copyWith(textTheme: _smallTextTheme);
  // }

  // /// `ThemeData` for ExpenseTracker UI for large screens.
  // static ThemeData get large {
  //   return standard.copyWith(textTheme: _largeTextTheme);
  // }

  // static TextTheme get _textTheme {
  //   return TextTheme(
  //     displayLarge: ExpenseTrackerTextStyle.headline1,
  //     displayMedium: ExpenseTrackerTextStyle.headline2,
  //     displaySmall: ExpenseTrackerTextStyle.headline3,
  //     headlineMedium: ExpenseTrackerTextStyle.headline4,
  //     headlineSmall: ExpenseTrackerTextStyle.headline5,
  //     titleLarge: ExpenseTrackerTextStyle.headline6,
  //     titleMedium: ExpenseTrackerTextStyle.subtitle1,
  //     titleSmall: ExpenseTrackerTextStyle.subtitle2,
  //     bodyLarge: ExpenseTrackerTextStyle.bodyText1,
  //     bodyMedium: ExpenseTrackerTextStyle.bodyText2,
  //     bodySmall: ExpenseTrackerTextStyle.caption,
  //     labelSmall: ExpenseTrackerTextStyle.overline,
  //     labelLarge: ExpenseTrackerTextStyle.button,
  //   );
  // }

  // static TextTheme get _smallTextTheme {
  //   return TextTheme(
  //     displayLarge: ExpenseTrackerTextStyle.headline1.copyWith(
  //       fontSize: _textTheme.displayLarge!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     displayMedium: ExpenseTrackerTextStyle.headline2.copyWith(
  //       fontSize: _textTheme.displayMedium!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     displaySmall: ExpenseTrackerTextStyle.headline3.copyWith(
  //       fontSize: _textTheme.displaySmall!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     headlineMedium: ExpenseTrackerTextStyle.headline4.copyWith(
  //       fontSize: _textTheme.headlineMedium!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     headlineSmall: ExpenseTrackerTextStyle.headline5.copyWith(
  //       fontSize: _textTheme.headlineSmall!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     titleLarge: ExpenseTrackerTextStyle.headline6.copyWith(
  //       fontSize: _textTheme.titleLarge!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     titleMedium: ExpenseTrackerTextStyle.subtitle1.copyWith(
  //       fontSize: _textTheme.titleMedium!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     titleSmall: ExpenseTrackerTextStyle.subtitle2.copyWith(
  //       fontSize: _textTheme.titleSmall!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     bodyLarge: ExpenseTrackerTextStyle.bodyText1.copyWith(
  //       fontSize: _textTheme.bodyLarge!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     bodyMedium: ExpenseTrackerTextStyle.bodyText2.copyWith(
  //       fontSize: _textTheme.bodyMedium!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     bodySmall: ExpenseTrackerTextStyle.caption.copyWith(
  //       fontSize: _textTheme.bodySmall!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     labelSmall: ExpenseTrackerTextStyle.overline.copyWith(
  //       fontSize: _textTheme.labelSmall!.fontSize! * _smallTextScaleFactor,
  //     ),
  //     labelLarge: ExpenseTrackerTextStyle.button.copyWith(
  //       fontSize: _textTheme.labelLarge!.fontSize! * _smallTextScaleFactor,
  //     ),
  //   );
  // }

  // static TextTheme get _largeTextTheme {
  //   return TextTheme(
  //     displayLarge: ExpenseTrackerTextStyle.headline1.copyWith(
  //       fontSize: _textTheme.displayLarge!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     displayMedium: ExpenseTrackerTextStyle.headline2.copyWith(
  //       fontSize: _textTheme.displayMedium!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     displaySmall: ExpenseTrackerTextStyle.headline3.copyWith(
  //       fontSize: _textTheme.displaySmall!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     headlineMedium: ExpenseTrackerTextStyle.headline4.copyWith(
  //       fontSize: _textTheme.headlineMedium!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     headlineSmall: ExpenseTrackerTextStyle.headline5.copyWith(
  //       fontSize: _textTheme.headlineSmall!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     titleLarge: ExpenseTrackerTextStyle.headline6.copyWith(
  //       fontSize: _textTheme.titleLarge!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     titleMedium: ExpenseTrackerTextStyle.subtitle1.copyWith(
  //       fontSize: _textTheme.titleMedium!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     titleSmall: ExpenseTrackerTextStyle.subtitle2.copyWith(
  //       fontSize: _textTheme.titleSmall!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     bodyLarge: ExpenseTrackerTextStyle.bodyText1.copyWith(
  //       fontSize: _textTheme.bodyLarge!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     bodyMedium: ExpenseTrackerTextStyle.bodyText2.copyWith(
  //       fontSize: _textTheme.bodyMedium!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     bodySmall: ExpenseTrackerTextStyle.caption.copyWith(
  //       fontSize: _textTheme.bodySmall!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     labelSmall: ExpenseTrackerTextStyle.overline.copyWith(
  //       fontSize: _textTheme.labelSmall!.fontSize! * _largeTextScaleFactor,
  //     ),
  //     labelLarge: ExpenseTrackerTextStyle.button.copyWith(
  //       fontSize: _textTheme.labelLarge!.fontSize! * _largeTextScaleFactor,
  //     ),
  //   );
  // }

  // static AppBarTheme get _appBarTheme {
  //   return const AppBarTheme(
  //     color: ExpenseTrackerColors.primary,
  //     centerTitle: true,
  //   );
  // }

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

  // static TooltipThemeData get _tooltipTheme {
  //   return const TooltipThemeData(
  //     decoration: BoxDecoration(
  //       color: ExpenseTrackerColors.charcoal,
  //       borderRadius: BorderRadius.all(Radius.circular(5)),
  //     ),
  //     padding: EdgeInsets.all(10),
  //     textStyle: TextStyle(color: ExpenseTrackerExpenseTrackerColors.white),
  //   );
  // }

  // static DialogTheme get _dialogTheme {
  //   return DialogTheme(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //   );
  // }

  // static BottomSheetThemeData get _bottomSheetTheme {
  //   return const BottomSheetThemeData(
  //     backgroundColor: ExpenseTrackerExpenseTrackerColors.whiteBackground,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
  //     ),
  //   );
  // }

  // static TabBarTheme get _tabBarTheme {
  //   return const TabBarTheme(
  //     indicator: UnderlineTabIndicator(
  //       borderSide: BorderSide(
  //         width: 2,
  //         color: ExpenseTrackerColors.primary,
  //       ),
  //     ),
  //     labelColor: ExpenseTrackerColors.primary,
  //     unselectedLabelColor: ExpenseTrackerColors.black25,
  //     indicatorSize: TabBarIndicatorSize.tab,
  //   );
  // }

  // static DividerThemeData get _dividerTheme {
  //   return const DividerThemeData(
  //     space: 0,
  //     thickness: 1,
  //     color: ExpenseTrackerColors.black25,
  //   );
  // }

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
