// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/account_page/account/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AccountCubit(),
          child: MaterialApp(home: AccountBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
