// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/expensedetails.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpensedetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ExpensedetailsCubit(),
          child: MaterialApp(home: ExpensedetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
