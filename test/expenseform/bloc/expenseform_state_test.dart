// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';

void main() {
  group('ExpenseformState', () {
    test('supports value equality', () {
      expect(
        ExpenseformState(),
        equals(
          const ExpenseformState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ExpenseformState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const expenseformState = ExpenseformState(
            customProperty: 'My property',
          );
          expect(
            expenseformState.copyWith(),
            equals(expenseformState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const expenseformState = ExpenseformState(
            customProperty: 'My property',
          );
          final otherExpenseformState = ExpenseformState(
            customProperty: 'My property 2',
          );
          expect(expenseformState, isNot(equals(otherExpenseformState)));

          expect(
            expenseformState.copyWith(
              customProperty: otherExpenseformState.customProperty,
            ),
            equals(otherExpenseformState),
          );
        },
      );
    });
  });
}
