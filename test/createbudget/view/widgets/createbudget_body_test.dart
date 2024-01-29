// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/createbudget/createbudget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreatebudgetBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CreatebudgetCubit(),
          child: MaterialApp(home: CreatebudgetBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
