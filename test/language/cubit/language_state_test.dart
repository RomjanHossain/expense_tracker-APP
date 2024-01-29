// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/language/cubit/cubit.dart';

void main() {
  group('LanguageState', () {
    test('supports value equality', () {
      expect(
        LanguageState(),
        equals(
          const LanguageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const LanguageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const languageState = LanguageState(
            customProperty: 'My property',
          );
          expect(
            languageState.copyWith(),
            equals(languageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const languageState = LanguageState(
            customProperty: 'My property',
          );
          final otherLanguageState = LanguageState(
            customProperty: 'My property 2',
          );
          expect(languageState, isNot(equals(otherLanguageState)));

          expect(
            languageState.copyWith(
              customProperty: otherLanguageState.customProperty,
            ),
            equals(otherLanguageState),
          );
        },
      );
    });
  });
}
