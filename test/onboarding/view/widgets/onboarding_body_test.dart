// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding.d/onboarding.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: OnboardingBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
