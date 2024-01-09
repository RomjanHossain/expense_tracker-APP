import 'package:freezed_annotation/freezed_annotation.dart';
part 'expense_form_entity.freezed.dart';

@freezed
class ExpenseFormEntity with _$ExpenseFormEntity {
  const factory ExpenseFormEntity({
    required bool isExpense,

    /// subscription start date
    DateTime? subStart,
    // String? subStartDay,

    /// subscription end date
    DateTime? subEnd,
    // sub type
    String? subType,
  }) = _ExpenseFormEntity;
}
