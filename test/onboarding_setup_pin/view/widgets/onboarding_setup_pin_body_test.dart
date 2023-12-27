// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/onboarding_setup_pin/onboarding_setup_pin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingSetupPinBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => OnboardingSetupPinBloc(),
          child: MaterialApp(home: OnboardingSetupPinBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
