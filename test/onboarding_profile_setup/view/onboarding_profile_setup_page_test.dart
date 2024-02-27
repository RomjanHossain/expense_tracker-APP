// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/onboarding_profile_setup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingProfileSetupPage', () {
    group('route', () {
      test('is routable', () {
        expect(OnboardingProfileSetupPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OnboardingProfileSetupView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingProfileSetupPage()));
      expect(find.byType(OnboardingProfileSetupView), findsOneWidget);
    });
  });
}
