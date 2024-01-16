// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/language/cubit/cubit.dart';

void main() {
  group('LanguageCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LanguageCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final languageCubit = LanguageCubit();
      expect(languageCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<LanguageCubit, LanguageState>(
      'yourCustomFunction emits nothing',
      build: LanguageCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <LanguageState>[],
    );
  });
}
