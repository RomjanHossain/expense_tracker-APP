// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomepagePage', () {
    group('route', () {
      test('is routable', () {
        expect(HomepagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomepageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomepagePage()));
      expect(find.byType(HomepageView), findsOneWidget);
    });
  });
}
