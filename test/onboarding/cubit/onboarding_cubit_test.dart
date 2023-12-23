// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding/cubit/cubit.dart';

void main() {
  group('OnboardingCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          OnboardingCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final onboardingCubit = OnboardingCubit();
      expect(onboardingCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<OnboardingCubit, OnboardingState>(
      'yourCustomFunction emits nothing',
      build: OnboardingCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <OnboardingState>[],
    );
  });
}
