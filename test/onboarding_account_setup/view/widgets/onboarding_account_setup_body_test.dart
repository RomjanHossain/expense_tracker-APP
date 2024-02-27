// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/onboarding_account_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardingAccountSetupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => OnboardingAccountSetupBloc(),
          child: MaterialApp(home: OnboardingAccountSetupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
