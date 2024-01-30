// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/about/about.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AboutPage', () {
    group('route', () {
      test('is routable', () {
        expect(AboutPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AboutView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AboutPage()));
      expect(find.byType(AboutView), findsOneWidget);
    });
  });
}
