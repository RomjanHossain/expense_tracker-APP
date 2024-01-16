// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/language/language.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LanguagePage', () {
    group('route', () {
      test('is routable', () {
        expect(LanguagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders LanguageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LanguagePage()));
      expect(find.byType(LanguageView), findsOneWidget);
    });
  });
}
