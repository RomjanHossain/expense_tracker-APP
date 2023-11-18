// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/transaction_graph_page/transaction_graph_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionGraphPagePage', () {
    group('route', () {
      test('is routable', () {
        expect(TransactionGraphPagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders TransactionGraphPageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: TransactionGraphPagePage()));
      expect(find.byType(TransactionGraphPageView), findsOneWidget);
    });
  });
}
