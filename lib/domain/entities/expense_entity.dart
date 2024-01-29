import 'package:freezed_annotation/freezed_annotation.dart';
part 'expense_entity.freezed.dart';

@freezed
class ExpenseEntity with _$ExpenseEntity {
  const factory ExpenseEntity({
    // income source (card,cash or anything else)
    required String incomeSource,
    // where the money were spent
    required String spentedON,
    // how much
    required double money,
    // when it was spent
    required String whenItWasSpent,
    // any comment?
    String? comment,
    // id
    int? id,
  }) = _ExpenseEntity;
}
