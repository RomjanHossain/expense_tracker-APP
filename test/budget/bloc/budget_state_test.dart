// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/budget/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BudgetState', () {
    test('supports value equality', () {
      expect(
        BudgetState(),
        equals(
          const BudgetState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const BudgetState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const budgetState = BudgetState(
            customProperty: 'My property',
          );
          expect(
            budgetState.copyWith(),
            equals(budgetState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const budgetState = BudgetState(
            customProperty: 'My property',
          );
          final otherBudgetState = BudgetState(
            customProperty: 'My property 2',
          );
          expect(budgetState, isNot(equals(otherBudgetState)));

          expect(
            budgetState.copyWith(
              customProperty: otherBudgetState.customProperty,
            ),
            equals(otherBudgetState),
          );
        },
      );
    });
  });
}
