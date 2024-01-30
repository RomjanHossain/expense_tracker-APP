// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/exportdata/cubit/cubit.dart';

void main() {
  group('ExportdataCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ExportdataCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final exportdataCubit = ExportdataCubit();
      expect(exportdataCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<ExportdataCubit, ExportdataState>(
      'yourCustomFunction emits nothing',
      build: ExportdataCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <ExportdataState>[],
    );
  });
}
