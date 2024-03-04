// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingSetupPinEvent', () {  
    group('CustomOnboardingSetupPinEvent', () {
      test('supports value equality', () {
        expect(
          CustomOnboardingSetupPinEvent(),
          equals(const CustomOnboardingSetupPinEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomOnboardingSetupPinEvent(),
          isNotNull,
        );
      });
    });
  });
}
