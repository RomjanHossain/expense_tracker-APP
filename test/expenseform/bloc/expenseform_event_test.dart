// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpenseformEvent', () {  
    group('CustomExpenseformEvent', () {
      test('supports value equality', () {
        expect(
          CustomExpenseformEvent(),
          equals(const CustomExpenseformEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomExpenseformEvent(),
          isNotNull,
        );
      });
    });
  });
}
