// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/exportdata/exportdata.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExportdataPage', () {
    group('route', () {
      test('is routable', () {
        expect(ExportdataPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ExportdataView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ExportdataPage()));
      expect(find.byType(ExportdataView), findsOneWidget);
    });
  });
}
