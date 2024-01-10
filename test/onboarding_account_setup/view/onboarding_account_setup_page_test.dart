// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/onboarding_account_setup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingAccountSetupPage', () {
    group('route', () {
      test('is routable', () {
        expect(OnboardingAccountSetupPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OnboardingAccountSetupView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingAccountSetupPage()));
      expect(find.byType(OnboardingAccountSetupView), findsOneWidget);
    });
  });
}
