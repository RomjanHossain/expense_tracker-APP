import 'package:flutter/widgets.dart';

/// Defines the color palette for the ExpenseTracker UI.
abstract class ExpenseTrackerColors {
  ///* while color
  // static const Color white = Color(0xffffffff);

  /// scaffold background color (f7f9fa)
  static const Color scaffoldBackground = Color(0xffF7F9FA);

  /// inactive selected box color (f1f1fa)
  static const Color inactiveSelectedBox = Color(0xffF1F1FA);

  /// inactive icon color (c6c6c6)
  static const Color charcoal = Color(0xffc6c6c6);
  /*
  dark color palette
  */
  //// dark
  static const Color dark = Color(0xff0D0E0F);

  /// dark 25
  static const Color dark25 = Color(0xff292B2D);

  /// dark 50
  static const Color dark50 = Color(0xff212325);

  /// dark 75
  static const Color dark75 = Color(0xff161719);
  /*
  light color palette
  */
  //// light
  static const Color light = Color(0xffffffff);

  /// light 20 (91919F)
  static const Color light20 = Color(0xff91919f);

  /// light 40
  static const Color light40 = Color(0xffE3E5E5);

  /// light 60
  static const Color light60 = Color(0xffF1F1FA);

  /// light 80
  static const Color light80 = Color(0xffFCFCFC);
/*
  primary color palette
  */

  //// violet
  static const Color violet = Color(0xff7F3DFF);

  /// violet 20
  static const Color violet20 = Color(0xffEEE5FF);

  /// violet 40
  static const Color violet40 = Color(0xffD3BDFF);

  /// violet 60
  static const Color violet60 = Color(0xffB18AFF);

  /// violet 80
  static const Color violet80 = Color(0xff8F57FF);

  //// red
  static const Color red = Color(0xffFD3C4A);

  /// red 20
  static const Color red20 = Color(0xffFDD5D7);

  /// red 40
  static const Color red40 = Color(0xffFDA2A9);

  /// red 60
  static const Color red60 = Color(0xffFD6F7A);

  /// red 80
  static const Color red80 = Color(0xffFD5662);

  /// green (00A86B)
  static const Color green = Color(0xff00A86B);

  /// green 20 (CFFAEA)
  static const Color green20 = Color(0xffCFFAEA);

  /// green 40 (93EACA)
  static const Color green40 = Color(0xff93EACA);

  /// green 60 (65D1AA)
  static const Color green60 = Color(0xff65D1AA);

  /// green 80 (2AB784)
  static const Color green80 = Color(0xff2AB784);

  //// yellow
  static const Color yellow = Color(0xffFCAC12);

  /// yellow 20
  static const Color yellow20 = Color(0xffFCEED4);

  /// yellow 40
  static const Color yellow40 = Color(0xffFCDDA1);

  /// yellow 60
  static const Color yellow60 = Color(0xffFCCC6F);

  /// yellow 80
  static const Color yellow80 = Color(0xffFCBB3C);

  //// blue
  static const Color blue = Color(0xff0077FF);

  /// blue 20
  static const Color blue20 = Color(0xffBDDCFF);

  /// blue 40
  static const Color blue40 = Color(0xff8AC0FF);

  /// blue 60
  static const Color blue60 = Color(0xff57A5FF);

  /// blue 80
  static const Color blue80 = Color(0xff248AFF);

  /// linear gradient of hex 8b50ff with 100% opacity to 24% opacity
  static LinearGradient violetGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xff8B50FF),
      const Color(0xff8B50FF).withOpacity(0.24),
    ],
  );
}
