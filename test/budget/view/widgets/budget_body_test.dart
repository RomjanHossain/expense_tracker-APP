// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/budget/budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BudgetBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => BudgetBloc(),
          child: MaterialApp(home: BudgetBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
