// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/expensedetails/expensedetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensedetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(ExpensedetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ExpensedetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ExpensedetailsPage()));
      expect(find.byType(ExpensedetailsView), findsOneWidget);
    });
  });
}
