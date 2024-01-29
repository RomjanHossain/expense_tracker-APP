// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashScreenPage', () {
    group('route', () {
      test('is routable', () {
        expect(SplashScreenPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SplashScreenView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SplashScreenPage()));
      expect(find.byType(SplashScreenView), findsOneWidget);
    });
  });
}
