// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_profile_setup/onboarding_profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingProfileSetupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => OnboardingProfileSetupCubit(),
          child: MaterialApp(home: OnboardingProfileSetupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
