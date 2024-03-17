// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingProfileSetupState', () {
    test('supports value equality', () {
      expect(
        OnboardingProfileSetupState(),
        equals(
          const OnboardingProfileSetupState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OnboardingProfileSetupState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const onboardingProfileSetupState = OnboardingProfileSetupState(
            customProperty: 'My property',
          );
          expect(
            onboardingProfileSetupState.copyWith(),
            equals(onboardingProfileSetupState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const onboardingProfileSetupState = OnboardingProfileSetupState(
            customProperty: 'My property',
          );
          final otherOnboardingProfileSetupState = OnboardingProfileSetupState(
            customProperty: 'My property 2',
          );
          expect(onboardingProfileSetupState, isNot(equals(otherOnboardingProfileSetupState)));

          expect(
            onboardingProfileSetupState.copyWith(
              customProperty: otherOnboardingProfileSetupState.customProperty,
            ),
            equals(otherOnboardingProfileSetupState),
          );
        },
      );
    });
  });
}
