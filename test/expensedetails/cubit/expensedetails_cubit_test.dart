// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensedetailsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ExpensedetailsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final expensedetailsCubit = ExpensedetailsCubit();
      expect(expensedetailsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<ExpensedetailsCubit, ExpensedetailsState>(
      'yourCustomFunction emits nothing',
      build: ExpensedetailsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <ExpensedetailsState>[],
    );
  });
}
