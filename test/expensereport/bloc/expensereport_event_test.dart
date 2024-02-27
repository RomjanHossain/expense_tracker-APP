// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/expensereport/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensereportEvent', () {  
    group('CustomExpensereportEvent', () {
      test('supports value equality', () {
        expect(
          CustomExpensereportEvent(),
          equals(const CustomExpensereportEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomExpensereportEvent(),
          isNotNull,
        );
      });
    });
  });
}
