// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/theme/cubit/cubit.dart';

void main() {
  group('ThemeCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ThemeCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final themeCubit = ThemeCubit();
      expect(themeCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<ThemeCubit, ThemeState>(
      'yourCustomFunction emits nothing',
      build: ThemeCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <ThemeState>[],
    );
  });
}
