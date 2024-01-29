// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';

void main() {
  group('OnboardingAccountSetupEvent', () {  
    group('CustomOnboardingAccountSetupEvent', () {
      test('supports value equality', () {
        expect(
          CustomOnboardingAccountSetupEvent(),
          equals(const CustomOnboardingAccountSetupEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomOnboardingAccountSetupEvent(),
          isNotNull
        );
      });
    });
  });
}
