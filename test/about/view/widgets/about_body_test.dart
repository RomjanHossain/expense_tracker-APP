// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/about/about.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AboutBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        MaterialApp(home: AboutBody()),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
