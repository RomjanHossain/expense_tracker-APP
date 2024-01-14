// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/expensereport/bloc/bloc.dart';

void main() {
  group('ExpensereportState', () {
    test('supports value equality', () {
      expect(
        ExpensereportState(),
        equals(
          const ExpensereportState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ExpensereportState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const expensereportState = ExpensereportState(
            customProperty: 'My property',
          );
          expect(
            expensereportState.copyWith(),
            equals(expensereportState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const expensereportState = ExpensereportState(
            customProperty: 'My property',
          );
          final otherExpensereportState = ExpensereportState(
            customProperty: 'My property 2',
          );
          expect(expensereportState, isNot(equals(otherExpensereportState)));

          expect(
            expensereportState.copyWith(
              customProperty: otherExpensereportState.customProperty,
            ),
            equals(otherExpensereportState),
          );
        },
      );
    });
  });
}
