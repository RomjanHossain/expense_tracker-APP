// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/borrow_or_lend_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BorrowOrLendPagePage', () {
    group('route', () {
      test('is routable', () {
        expect(BorrowOrLendPagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders BorrowOrLendPageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BorrowOrLendPagePage()));
      expect(find.byType(BorrowOrLendPageView), findsOneWidget);
    });
  });
}
