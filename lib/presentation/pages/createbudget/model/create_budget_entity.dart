import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_budget_entity.freezed.dart';


@freezed
class CreateBudgetEntity with _$CreateBudgetEntity {
  const factory CreateBudgetEntity({
    required double amount,
    required String category,
    required bool isReceiveAlert,
    required double percent,
  }) = _CreateBudgetEntity;
}
