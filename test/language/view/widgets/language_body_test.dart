// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/pages/language/language.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LanguageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => LanguageCubit(),
          child: MaterialApp(home: LanguageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
