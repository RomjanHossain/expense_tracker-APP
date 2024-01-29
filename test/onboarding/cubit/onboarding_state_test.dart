// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding/cubit/cubit.dart';

void main() {
  group('OnboardingState', () {
    test('supports value equality', () {
      expect(
        OnboardingState(),
        equals(
          const OnboardingState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OnboardingState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const onboardingState = OnboardingState(
            customProperty: 'My property',
          );
          expect(
            onboardingState.copyWith(),
            equals(onboardingState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const onboardingState = OnboardingState(
            customProperty: 'My property',
          );
          final otherOnboardingState = OnboardingState(
            customProperty: 'My property 2',
          );
          expect(onboardingState, isNot(equals(otherOnboardingState)));

          expect(
            onboardingState.copyWith(
              customProperty: otherOnboardingState.customProperty,
            ),
            equals(otherOnboardingState),
          );
        },
      );
    });
  });
}
