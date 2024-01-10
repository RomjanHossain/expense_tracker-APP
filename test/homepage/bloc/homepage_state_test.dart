// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';

void main() {
  group('HomepageState', () {
    test('supports value equality', () {
      expect(
        HomepageState(),
        equals(
          const HomepageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const HomepageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const homepageState = HomepageState(
            customProperty: 'My property',
          );
          expect(
            homepageState.copyWith(),
            equals(homepageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const homepageState = HomepageState(
            customProperty: 'My property',
          );
          final otherHomepageState = HomepageState(
            customProperty: 'My property 2',
          );
          expect(homepageState, isNot(equals(otherHomepageState)));

          expect(
            homepageState.copyWith(
              customProperty: otherHomepageState.customProperty,
            ),
            equals(otherHomepageState),
          );
        },
      );
    });
  });
}
