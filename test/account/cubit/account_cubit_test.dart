// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/account/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AccountCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final accountCubit = AccountCubit();
      expect(accountCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AccountCubit, AccountState>(
      'yourCustomFunction emits nothing',
      build: AccountCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AccountState>[],
    );
  });
}
