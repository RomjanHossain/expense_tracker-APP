// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/createbudget/createbudget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreatebudgetPage', () {
    group('route', () {
      test('is routable', () {
        expect(CreatebudgetPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CreatebudgetView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CreatebudgetPage()));
      expect(find.byType(CreatebudgetView), findsOneWidget);
    });
  });
}
