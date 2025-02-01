import 'package:flutter/material.dart';

class PageTransitions {
  // fromCenterToBottom transition
  Animation<Offset> fromCenterToBottom(Animation<double> animation) {
// ignore: prefer_int_literals
    const begin = Offset(0.0, -0.5);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  /// fromRightToLeft
  Animation<Offset> fromRightToLeft(Animation<double> animation) {
    // ignore: prefer_int_literals
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  /// fromLeftToRight
  Animation<Offset> fromLeftToRight(Animation<double> animation) {
    // ignore: prefer_int_literals
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  /// from bottom to top
  Animation<Offset> fromBottomToTop(Animation<double> animation) {
    // ignore: prefer_int_literals
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  /// from top to bottom
  Animation<Offset> fromTopToBottom(Animation<double> animation) {
    // ignore: prefer_int_literals
    const begin = Offset(0.0, -1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  /// from center to top
  Animation<Offset> fromCenterToTop(Animation<double> animation) {
    // ignore: prefer_int_literals
    const begin = Offset(0.0, 0.5);
    const end = Offset.zero;
    const curve = Curves.ease;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }
}
