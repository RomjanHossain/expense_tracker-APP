// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/account_page/pages/currency/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CurrencyBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CurrencyCubit(),
          child: MaterialApp(home: CurrencyBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
