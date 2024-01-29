// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/theme/theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ThemeCubit(),
          child: MaterialApp(home: ThemeBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
