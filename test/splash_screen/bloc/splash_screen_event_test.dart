// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/splash_screen/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashScreenEvent', () {  
    group('CustomSplashScreenEvent', () {
      test('supports value equality', () {
        expect(
          CustomSplashScreenEvent(),
          equals(const CustomSplashScreenEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomSplashScreenEvent(),
          isNotNull,
        );
      });
    });
  });
}
