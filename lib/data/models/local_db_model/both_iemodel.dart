import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'both_iemodel.freezed.dart';

@freezed
class IEmodel with _$IEmodel {
  const factory IEmodel({
    required DateTime createdAt,
    required ExpenseType isIncome,
    required Expense? expense,
    required Income? income,
    required Transfer? transfer,
  }) = _IEmodel;
}
