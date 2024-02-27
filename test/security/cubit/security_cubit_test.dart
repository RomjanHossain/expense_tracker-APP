// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/security/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SecurityCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          SecurityCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final securityCubit = SecurityCubit();
      expect(securityCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<SecurityCubit, SecurityState>(
      'yourCustomFunction emits nothing',
      build: SecurityCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <SecurityState>[],
    );
  });
}
