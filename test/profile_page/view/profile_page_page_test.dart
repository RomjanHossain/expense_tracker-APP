// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/presentation/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfilePagePage', () {
    group('route', () {
      test('is routable', () {
        expect(ProfilePagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ProfilePageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ProfilePagePage()));
      expect(find.byType(ProfilePageView), findsOneWidget);
    });
  });
}
