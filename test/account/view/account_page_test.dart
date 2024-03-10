// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/account/account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountPage', () {
    group('route', () {
      test('is routable', () {
        expect(AccountPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AccountView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AccountPage()));
      expect(find.byType(AccountView), findsOneWidget);
    });
  });
}
