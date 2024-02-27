// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/cubit/cubit.dart';

void main() {
  group('OnboardingProfileSetupCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          OnboardingProfileSetupCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final onboardingProfileSetupCubit = OnboardingProfileSetupCubit();
      expect(onboardingProfileSetupCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<OnboardingProfileSetupCubit, OnboardingProfileSetupState>(
      'yourCustomFunction emits nothing',
      build: OnboardingProfileSetupCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <OnboardingProfileSetupState>[],
    );
  });
}
