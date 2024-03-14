import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/constrants/extensions_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<FlSpot?> getFlSpotFromIEmodel(
  List<IEmodel> models,
) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);

  final spots = <FlSpot>[];
  debugPrint('Total Len: ${totalEx.length}');
  for (final i in totalEx) {
    debugPrint(
        "x: ${i.expense!.createdDate!.toDoubleT}, y = ${i.expense?.ammount ?? 0}");
    spots.add(
      FlSpot(
        i.expense!.createdDate!.day.toDouble(),
        i.expense?.ammount ?? 0,
      ),
    );
  }
  return spots;
  // switch (stype) {
  //   case SegmentedButtonsData.today:
  //   case SegmentedButtonsData.week:
  //     final spots = <FlSpot>[];
  //     for (final i in totalEx) {
  //       // check if this week
  //       if (i.expense!.createdDate!.isThisWeek) {
  //         spots.add(
  //           FlSpot(
  //             i.expense!.createdDate!.toDoubleT,
  //             i.expense?.ammount ?? 0,
  //           ),
  //         );
  //       }
  //     }
  //     return spots;
  //   case SegmentedButtonsData.month:
  //     final spots = <FlSpot>[];
  //     for (final i in totalEx) {
  //       if (i.expense!.createdDate!.isThisMonth) {
  //         spots.add(
  //           FlSpot(
  //             i.expense!.createdDate!.toDoubleT,
  //             i.expense?.ammount ?? 0,
  //           ),
  //         );
  //       }
  //     }
  //     return spots;
  //   case SegmentedButtonsData.year:
  //     final spots = <FlSpot>[];
  //     for (final i in totalEx) {
  //       if (i.expense!.createdDate!.isThisYear) {
  //         spots.add(
  //           FlSpot(
  //             i.expense!.createdDate!.toDoubleT,
  //             i.expense?.ammount ?? 0,
  //           ),
  //         );
  //       }
  //     }
  //     return spots;
  // }
}
