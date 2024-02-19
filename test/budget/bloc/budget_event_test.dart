// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/budget/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BudgetEvent', () {  
    group('CustomBudgetEvent', () {
      test('supports value equality', () {
        expect(
          CustomBudgetEvent(),
          equals(const CustomBudgetEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomBudgetEvent(),
          isNotNull,
        );
      });
    });
  });
}
