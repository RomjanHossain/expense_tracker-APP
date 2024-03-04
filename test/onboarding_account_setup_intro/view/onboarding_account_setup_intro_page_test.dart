// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup_intro/onboarding_account_setup_intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingAccountSetupIntroPage', () {
    group('route', () {
      test('is routable', () {
        expect(OnboardingAccountSetupIntroPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OnboardingAccountSetupIntroView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingAccountSetupIntroPage()));
      expect(find.byType(OnboardingAccountSetupIntroView), findsOneWidget);
    });
  });
}
