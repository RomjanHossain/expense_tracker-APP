// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/account_page/pages/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemePage', () {
    group('route', () {
      test('is routable', () {
        expect(ThemePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ThemeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ThemePage()));
      expect(find.byType(ThemeView), findsOneWidget);
    });
  });
}
