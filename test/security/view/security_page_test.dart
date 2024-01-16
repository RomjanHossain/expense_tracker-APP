// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/security/security.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SecurityPage', () {
    group('route', () {
      test('is routable', () {
        expect(SecurityPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SecurityView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SecurityPage()));
      expect(find.byType(SecurityView), findsOneWidget);
    });
  });
}
