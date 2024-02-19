// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/settings/pages/help/help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HelpPage', () {
    group('route', () {
      test('is routable', () {
        expect(HelpPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HelpView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HelpPage()));
      expect(find.byType(HelpView), findsOneWidget);
    });
  });
}
