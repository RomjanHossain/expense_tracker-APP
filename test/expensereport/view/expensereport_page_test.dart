// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/expensereport/expensereport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensereportPage', () {
    group('route', () {
      test('is routable', () {
        expect(ExpensereportPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ExpensereportView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ExpensereportPage()));
      expect(find.byType(ExpensereportView), findsOneWidget);
    });
  });
}
