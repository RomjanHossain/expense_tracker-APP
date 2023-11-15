// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/splash_screen/bloc/bloc.dart';

void main() {
  group('SplashScreenState', () {
    test('supports value equality', () {
      expect(
        SplashScreenState(),
        equals(
          const SplashScreenState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const SplashScreenState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const splashScreenState = SplashScreenState(
            customProperty: 'My property',
          );
          expect(
            splashScreenState.copyWith(),
            equals(splashScreenState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const splashScreenState = SplashScreenState(
            customProperty: 'My property',
          );
          final otherSplashScreenState = SplashScreenState(
            customProperty: 'My property 2',
          );
          expect(splashScreenState, isNot(equals(otherSplashScreenState)));

          expect(
            splashScreenState.copyWith(
              customProperty: otherSplashScreenState.customProperty,
            ),
            equals(otherSplashScreenState),
          );
        },
      );
    });
  });
}
