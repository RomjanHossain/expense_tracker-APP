// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/cubit/cubit.dart';

void main() {
  group('AccountDetailCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AccountDetailCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final accountDetailCubit = AccountDetailCubit();
      expect(accountDetailCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AccountDetailCubit, AccountDetailState>(
      'yourCustomFunction emits nothing',
      build: AccountDetailCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AccountDetailState>[],
    );
  });
}
