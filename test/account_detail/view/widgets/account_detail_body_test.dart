// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/account_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountDetailBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AccountDetailCubit(),
          child: MaterialApp(home: AccountDetailBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
