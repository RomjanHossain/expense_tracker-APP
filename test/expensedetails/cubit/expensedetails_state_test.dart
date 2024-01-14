// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/cubit/cubit.dart';

void main() {
  group('ExpensedetailsState', () {
    test('supports value equality', () {
      expect(
        ExpensedetailsState(),
        equals(
          const ExpensedetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ExpensedetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const expensedetailsState = ExpensedetailsState(
            customProperty: 'My property',
          );
          expect(
            expensedetailsState.copyWith(),
            equals(expensedetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const expensedetailsState = ExpensedetailsState(
            customProperty: 'My property',
          );
          final otherExpensedetailsState = ExpensedetailsState(
            customProperty: 'My property 2',
          );
          expect(expensedetailsState, isNot(equals(otherExpensedetailsState)));

          expect(
            expensedetailsState.copyWith(
              customProperty: otherExpensedetailsState.customProperty,
            ),
            equals(otherExpensedetailsState),
          );
        },
      );
    });
  });
}
