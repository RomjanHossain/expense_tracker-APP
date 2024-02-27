// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/budget/budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BudgetPage', () {
    group('route', () {
      test('is routable', () {
        expect(BudgetPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders BudgetView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BudgetPage()));
      expect(find.byType(BudgetView), findsOneWidget);
    });
  });
}
