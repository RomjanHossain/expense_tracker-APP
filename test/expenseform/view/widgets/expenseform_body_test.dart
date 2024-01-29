// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/expenseform/expenseform.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpenseformBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ExpenseformBloc(),
          child: MaterialApp(home: ExpenseformBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
