// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/account_page/account/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountState', () {
    test('supports value equality', () {
      expect(
        AccountState(),
        equals(
          const AccountState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AccountState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const accountState = AccountState(
            customProperty: 'My property',
          );
          expect(
            accountState.copyWith(),
            equals(accountState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const accountState = AccountState(
            customProperty: 'My property',
          );
          final otherAccountState = AccountState(
            customProperty: 'My property 2',
          );
          expect(accountState, isNot(equals(otherAccountState)));

          expect(
            accountState.copyWith(
              customProperty: otherAccountState.customProperty,
            ),
            equals(otherAccountState),
          );
        },
      );
    });
  });
}
