// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/exportdata/exportdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExportdataBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ExportdataCubit(),
          child: MaterialApp(home: ExportdataBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
