// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/account_page/pages/theme/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeState', () {
    test('supports value equality', () {
      expect(
        ThemeState(),
        equals(
          const ThemeState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ThemeState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const themeState = ThemeState(
            customProperty: 'My property',
          );
          expect(
            themeState.copyWith(),
            equals(themeState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const themeState = ThemeState(
            customProperty: 'My property',
          );
          final otherThemeState = ThemeState(
            customProperty: 'My property 2',
          );
          expect(themeState, isNot(equals(otherThemeState)));

          expect(
            themeState.copyWith(
              customProperty: otherThemeState.customProperty,
            ),
            equals(otherThemeState),
          );
        },
      );
    });
  });
}
