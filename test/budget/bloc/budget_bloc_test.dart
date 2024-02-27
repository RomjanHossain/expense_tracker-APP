// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/budget/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BudgetBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          BudgetBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final budgetBloc = BudgetBloc();
      expect(budgetBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<BudgetBloc, BudgetState>(
      'CustomBudgetEvent emits nothing',
      build: BudgetBloc.new,
      act: (bloc) => bloc.add(const CustomBudgetEvent()),
      expect: () => <BudgetState>[],
    );
  });
}
