// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/onboarding_setup_pin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingSetupPinPage', () {
    group('route', () {
      test('is routable', () {
        expect(OnboardingSetupPinPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OnboardingSetupPinView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardingSetupPinPage()));
      expect(find.byType(OnboardingSetupPinView), findsOneWidget);
    });
  });
}
