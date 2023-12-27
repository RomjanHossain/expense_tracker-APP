// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/bloc/bloc.dart';

void main() {
  group('OnboardingSetupPinBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          OnboardingSetupPinBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final onboardingSetupPinBloc = OnboardingSetupPinBloc();
      expect(onboardingSetupPinBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<OnboardingSetupPinBloc, OnboardingSetupPinState>(
      'CustomOnboardingSetupPinEvent emits nothing',
      build: OnboardingSetupPinBloc.new,
      act: (bloc) => bloc.add(const CustomOnboardingSetupPinEvent()),
      expect: () => <OnboardingSetupPinState>[],
    );
  });
}
