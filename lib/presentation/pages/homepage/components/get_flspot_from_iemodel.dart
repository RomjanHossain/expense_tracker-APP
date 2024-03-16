import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/constrants/extensions_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//!INFO: get min amount value from IEmodel
double getMinAmountValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final amounts = totalEx.map((e) => e.expense?.ammount ?? 0);
  if (amounts.isEmpty) {
    return 0;
  }
  final min =
      amounts.reduce((value, element) => value < element ? value : element);
  // .reduce((value, element) => value < element ? value : element);
  debugPrint('min amount: $min');
  return min;
}

//!INFO: get max amount value from IEmodel
double getMaxAmountValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final amounts = totalEx.map((e) => e.expense?.ammount ?? 0);
  // .reduce((value, element) => value > element ? value : element);
  if (amounts.isEmpty) {
    return 0;
  }
  final max =
      amounts.reduce((value, element) => value > element ? value : element);
  debugPrint('max amount: $max');
  return max;
}

//!INFO: get min createdDate value from IEmodel
double getMinCreatedDateValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final createdDates = totalEx.map((e) => e.expense!.createdDate!.toDoubleT);
  if (createdDates.isEmpty) {
    return 0;
  }
  final min = createdDates.reduce(
    (value, element) {
      return value < element ? value : element;
    },
  );

  debugPrint('min createdDate: $min');
  return min;
}

//!INFO: get max createdDate value from IEmodel
double getMaxCreatedDateValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final createdDates = totalEx.map((e) => e.expense!.createdDate!.toDoubleT);
  if (createdDates.isEmpty) {
    return 0;
  }
  final max = createdDates
      .reduce((value, element) => value > element ? value : element);
  // .reduce((value, element) => value > element ? value : element);
  debugPrint('max createdDate: $max');
  return max;
}

//INFO: this function is for today

List<FlSpot> getFlSpotFromIEmodelToday(
  List<IEmodel> models,
) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);

  final spots = <FlSpot>[];
  final c_s = totalEx.map((e) => e.expense!.createdDate!);
  final x_s = totalEx.map((e) => e.expense!.createdDate!.toDoubleT);
  final y_s = totalEx.map((e) => e.expense?.ammount ?? 0);
  debugPrint('c_s: $c_s');
  debugPrint('x_s: $x_s');
  return List.generate(
    x_s.length,
    (index) => FlSpot(
      x_s.elementAt(index),
      y_s.elementAt(index),
    ),
  );
  // debugPrint('Total Len: ${totalEx.length}');
  // for (final i in totalEx) {
  //   final x = i.expense!.createdDate!.toDoubleT;
  //   final y = i.expense?.ammount ?? 0;
  //   debugPrint(
  //     'x: $x, y = $y',
  //   );
  //   spots.add(
  //     FlSpot(
  //       x,
  //       y,
  //     ),
  //   );
  // }
  debugPrint('Len of sports: ${spots.length}');
  return spots;
}

// INFO: This function is used to convert the IEmodel to FlSpot
List<FlSpot?> getFlSpotFromIEmodel(
  List<IEmodel> models,
) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);

  final spots = <FlSpot>[];
  // debugPrint('Total Len: ${totalEx.length}');
  for (final i in totalEx) {
    debugPrint(
      'x: ${i.expense!.createdDate!.toDoubleT}, y = ${i.expense?.ammount ?? 0}',
    );
    spots.add(
      FlSpot(
        i.expense!.createdDate!.day.toDouble(),
        i.expense?.ammount ?? 0,
      ),
    );
  }
  return spots;
}
