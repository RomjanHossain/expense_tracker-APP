// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/account_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountDetailPage', () {
    group('route', () {
      test('is routable', () {
        expect(AccountDetailPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AccountDetailView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AccountDetailPage()));
      expect(find.byType(AccountDetailView), findsOneWidget);
    });
  });
}
