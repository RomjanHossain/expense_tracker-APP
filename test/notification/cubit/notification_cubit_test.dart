// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          NotificationCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final notificationCubit = NotificationCubit();
      expect(notificationCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<NotificationCubit, NotificationState>(
      'yourCustomFunction emits nothing',
      build: NotificationCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <NotificationState>[],
    );
  });
}
