// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/bloc.dart';

void main() {
  group('ExpenseformBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ExpenseformBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final expenseformBloc = ExpenseformBloc();
      expect(expenseformBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ExpenseformBloc, ExpenseformState>(
      'CustomExpenseformEvent emits nothing',
      build: ExpenseformBloc.new,
      act: (bloc) => bloc.add(const CustomExpenseformEvent()),
      expect: () => <ExpenseformState>[],
    );
  });
}
