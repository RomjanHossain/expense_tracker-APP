// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingAccountSetupState', () {
    test('supports value equality', () {
      expect(
        OnboardingAccountSetupState(),
        equals(
          const OnboardingAccountSetupState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OnboardingAccountSetupState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const onboardingAccountSetupState = OnboardingAccountSetupState(
            customProperty: 'My property',
          );
          expect(
            onboardingAccountSetupState.copyWith(),
            equals(onboardingAccountSetupState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const onboardingAccountSetupState = OnboardingAccountSetupState(
            customProperty: 'My property',
          );
          final otherOnboardingAccountSetupState = OnboardingAccountSetupState(
            customProperty: 'My property 2',
          );
          expect(onboardingAccountSetupState, isNot(equals(otherOnboardingAccountSetupState)));

          expect(
            onboardingAccountSetupState.copyWith(
              customProperty: otherOnboardingAccountSetupState.customProperty,
            ),
            equals(otherOnboardingAccountSetupState),
          );
        },
      );
    });
  });
}
