// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/security/cubit/cubit.dart';

void main() {
  group('SecurityState', () {
    test('supports value equality', () {
      expect(
        SecurityState(),
        equals(
          const SecurityState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const SecurityState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const securityState = SecurityState(
            customProperty: 'My property',
          );
          expect(
            securityState.copyWith(),
            equals(securityState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const securityState = SecurityState(
            customProperty: 'My property',
          );
          final otherSecurityState = SecurityState(
            customProperty: 'My property 2',
          );
          expect(securityState, isNot(equals(otherSecurityState)));

          expect(
            securityState.copyWith(
              customProperty: otherSecurityState.customProperty,
            ),
            equals(otherSecurityState),
          );
        },
      );
    });
  });
}
