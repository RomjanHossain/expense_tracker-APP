// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingAccountSetupBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          OnboardingAccountSetupBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final onboardingAccountSetupBloc = OnboardingAccountSetupBloc();
      expect(onboardingAccountSetupBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<OnboardingAccountSetupBloc, OnboardingAccountSetupState>(
      'CustomOnboardingAccountSetupEvent emits nothing',
      build: OnboardingAccountSetupBloc.new,
      act: (bloc) => bloc.add(const CustomOnboardingAccountSetupEvent()),
      expect: () => <OnboardingAccountSetupState>[],
    );
  });
}
