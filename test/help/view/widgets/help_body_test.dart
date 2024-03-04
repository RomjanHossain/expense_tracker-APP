// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/settings/pages/help/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HelpBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: HelpBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
