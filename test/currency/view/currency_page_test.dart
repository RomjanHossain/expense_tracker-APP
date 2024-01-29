// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/currency/currency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyPage', () {
    group('route', () {
      test('is routable', () {
        expect(CurrencyPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CurrencyView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CurrencyPage()));
      expect(find.byType(CurrencyView), findsOneWidget);
    });
  });
}
