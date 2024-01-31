// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:expense_tracker/presentation/pages/exportdata/cubit/cubit.dart';

void main() {
  group('ExportdataState', () {
    test('supports value equality', () {
      expect(
        ExportdataState(),
        equals(
          const ExportdataState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ExportdataState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const exportdataState = ExportdataState(
            customProperty: 'My property',
          );
          expect(
            exportdataState.copyWith(),
            equals(exportdataState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const exportdataState = ExportdataState(
            customProperty: 'My property',
          );
          final otherExportdataState = ExportdataState(
            customProperty: 'My property 2',
          );
          expect(exportdataState, isNot(equals(otherExportdataState)));

          expect(
            exportdataState.copyWith(
              customProperty: otherExportdataState.customProperty,
            ),
            equals(otherExportdataState),
          );
        },
      );
    });
  });
}
