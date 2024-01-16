// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/currency/cubit/cubit.dart';

void main() {
  group('CurrencyCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CurrencyCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final currencyCubit = CurrencyCubit();
      expect(currencyCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<CurrencyCubit, CurrencyState>(
      'yourCustomFunction emits nothing',
      build: CurrencyCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <CurrencyState>[],
    );
  });
}
