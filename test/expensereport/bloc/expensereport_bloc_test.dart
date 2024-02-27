// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/expensereport/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensereportBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ExpensereportBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final expensereportBloc = ExpensereportBloc();
      expect(expensereportBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ExpensereportBloc, ExpensereportState>(
      'CustomExpensereportEvent emits nothing',
      build: ExpensereportBloc.new,
      act: (bloc) => bloc.add(const CustomExpensereportEvent()),
      expect: () => <ExpensereportState>[],
    );
  });
}
