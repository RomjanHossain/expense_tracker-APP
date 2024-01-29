// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/expenseform/expenseform.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpenseformPage', () {
    group('route', () {
      test('is routable', () {
        expect(ExpenseformPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ExpenseformView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ExpenseformPage()));
      expect(find.byType(ExpenseformView), findsOneWidget);
    });
  });
}
