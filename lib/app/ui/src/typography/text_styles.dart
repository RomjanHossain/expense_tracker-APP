import 'package:flutter/material.dart';

//// ExpenseTracker Text Style Definitions
class ExpenseTrackerTextStyle {
  static final TextTheme _baseTextStyle = ThemeData.light().textTheme;

  /// title x (64)(80)
  static TextStyle get titleX {
    return _baseTextStyle.displayLarge!.copyWith(
      fontSize: 64,
      height: 1.25,
    );
  }

  /// title 1 (32)(39)
  static TextStyle get title1 {
    return _baseTextStyle.headlineLarge!.copyWith(
      height: 1.21875,
      fontSize: 32,
    );
  }

  /// title 2 (24)(22)
  static TextStyle get title2 {
    return _baseTextStyle.headlineSmall!.copyWith(
      height: 0.9166666666666666,
      fontSize: 24,
    );
  }

  /// title 3 (18)(22)
  static TextStyle get title3 {
    return _baseTextStyle.titleMedium!.copyWith(
      fontSize: 18,
      height: 1.2222222222222223,
    );
  }

  /// regular 1 (16)(19)
  static TextStyle get body1 {
    return _baseTextStyle.bodyLarge!.copyWith(
      height: 1.1875,
      fontSize: 16,
    );
  }

  /// regular 2 (16)(19)
  static TextStyle get body2 {
    return _baseTextStyle.titleMedium!.copyWith(
      height: 1.1875,
      fontSize: 16,
    );
  }

  /// regular 3 (14)(18)
  static TextStyle get body3 {
    return _baseTextStyle.bodyMedium!.copyWith(
      height: 1.2857142857142858,
      fontSize: 14,
    );
  }

  /// small 13/16
  static TextStyle get small {
    return _baseTextStyle.bodySmall!.copyWith(
      fontSize: 13,
      height: 1.2307692307692308,
    );
  }

  /// tiny
  static TextStyle get tiny {
    return _baseTextStyle.bodySmall!.copyWith(
      height: 1,
      fontSize: 12,
    );
  }
}
