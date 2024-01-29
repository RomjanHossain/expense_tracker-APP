// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/bloc/bloc.dart';

void main() {
  group('OnboardingSetupPinState', () {
    test('supports value equality', () {
      expect(
        OnboardingSetupPinState(),
        equals(
          const OnboardingSetupPinState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OnboardingSetupPinState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const onboardingSetupPinState = OnboardingSetupPinState(
            customProperty: 'My property',
          );
          expect(
            onboardingSetupPinState.copyWith(),
            equals(onboardingSetupPinState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const onboardingSetupPinState = OnboardingSetupPinState(
            customProperty: 'My property',
          );
          final otherOnboardingSetupPinState = OnboardingSetupPinState(
            customProperty: 'My property 2',
          );
          expect(onboardingSetupPinState, isNot(equals(otherOnboardingSetupPinState)));

          expect(
            onboardingSetupPinState.copyWith(
              customProperty: otherOnboardingSetupPinState.customProperty,
            ),
            equals(otherOnboardingSetupPinState),
          );
        },
      );
    });
  });
}
