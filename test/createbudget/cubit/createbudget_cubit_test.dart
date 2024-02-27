// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/createbudget/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreatebudgetCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CreatebudgetCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final createbudgetCubit = CreatebudgetCubit();
      expect(createbudgetCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<CreatebudgetCubit, CreatebudgetState>(
      'yourCustomFunction emits nothing',
      build: CreatebudgetCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <CreatebudgetState>[],
    );
  });
}
