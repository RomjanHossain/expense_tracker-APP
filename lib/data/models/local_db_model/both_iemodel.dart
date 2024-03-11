import 'package:expense_tracker/data/models/isar_entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/income_entity/income_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/transfer_entity/transfer_entity.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'both_iemodel.freezed.dart';

@freezed
class IEmodel with _$IEmodel {
  const factory IEmodel({
    required DateTime createdAt,
    required ExpenseType isIncome,
    required ExpenseIsarEntity? expense,
    required IncomeIsarEntity? income,
    required TransferEntity? transfer,
  }) = _IEmodel;
}
