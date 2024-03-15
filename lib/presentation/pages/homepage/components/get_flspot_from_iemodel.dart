import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/constrants/extensions_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//!INFO: get min amount value from IEmodel
double getMinAmountValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final min = totalEx
      .map((e) => e.expense?.ammount ?? 0)
      .reduce((value, element) => value < element ? value : element);
  return min;
}

//!INFO: get max amount value from IEmodel
double getMaxAmountValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final max = totalEx
      .map((e) => e.expense?.ammount ?? 0)
      .reduce((value, element) => value > element ? value : element);
  return max;
}

//!INFO: get min createdDate value from IEmodel
double getMinCreatedDateValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final min = totalEx
      .map((e) => e.expense!.createdDate!.toDoubleT)
      .reduce((value, element) => value < element ? value : element);
  return min;
}

//!INFO: get max createdDate value from IEmodel
double getMaxCreatedDateValueFromIEmodel(List<IEmodel> models) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);
  final max = totalEx
      .map((e) => e.expense!.createdDate!.toDoubleT)
      .reduce((value, element) => value > element ? value : element);
  return max;
}

//INFO: this function is for today

List<FlSpot> getFlSpotFromIEmodelToday(
  List<IEmodel> models,
) {
  final totalEx =
      models.where((element) => element.isIncome == ExpenseType.expense);

  final spots = <FlSpot>[];
  // debugPrint('Total Len: ${totalEx.length}');
  for (final i in totalEx) {
    final x = i.expense!.createdDate!.toDoubleT;
    final y = i.expense?.ammount ?? 0;
    debugPrint(
      'x: $x, y = $y',
    );
    spots.add(
      FlSpot(
        x,
        y,
      ),
    );
  }
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
