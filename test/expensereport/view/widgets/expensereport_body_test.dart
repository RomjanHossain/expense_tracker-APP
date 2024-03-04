// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/expensereport/expensereport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensereportBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ExpensereportBloc(),
          child: MaterialApp(home: ExpensereportBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
