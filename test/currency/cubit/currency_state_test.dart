// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/account_page/pages/currency/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyState', () {
    test('supports value equality', () {
      expect(
        CurrencyState(),
        equals(
          const CurrencyState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CurrencyState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const currencyState = CurrencyState(
            customProperty: 'My property',
          );
          expect(
            currencyState.copyWith(),
            equals(currencyState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const currencyState = CurrencyState(
            customProperty: 'My property',
          );
          final otherCurrencyState = CurrencyState(
            customProperty: 'My property 2',
          );
          expect(currencyState, isNot(equals(otherCurrencyState)));

          expect(
            currencyState.copyWith(
              customProperty: otherCurrencyState.customProperty,
            ),
            equals(otherCurrencyState),
          );
        },
      );
    });
  });
}
