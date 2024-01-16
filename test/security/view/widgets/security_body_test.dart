// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/security/security.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SecurityBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => SecurityCubit(),
          child: MaterialApp(home: SecurityBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
