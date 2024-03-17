// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/cubit/cubit.dart';

void main() {
  group('AccountDetailState', () {
    test('supports value equality', () {
      expect(
        AccountDetailState(),
        equals(
          const AccountDetailState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AccountDetailState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const accountDetailState = AccountDetailState(
            customProperty: 'My property',
          );
          expect(
            accountDetailState.copyWith(),
            equals(accountDetailState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const accountDetailState = AccountDetailState(
            customProperty: 'My property',
          );
          final otherAccountDetailState = AccountDetailState(
            customProperty: 'My property 2',
          );
          expect(accountDetailState, isNot(equals(otherAccountDetailState)));

          expect(
            accountDetailState.copyWith(
              customProperty: otherAccountDetailState.customProperty,
            ),
            equals(otherAccountDetailState),
          );
        },
      );
    });
  });
}
