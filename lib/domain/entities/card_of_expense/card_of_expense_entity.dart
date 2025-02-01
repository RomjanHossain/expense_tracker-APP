import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_of_expense_entity.freezed.dart';

@freezed
class CardOfExpenseEntity with _$CardOfExpenseEntity {
  const factory CardOfExpenseEntity({
    required Color color,
    required String title,
    required String subtitle,
    required double amount,
    required String date,
  }) = _CardOfExpenseEntity;
}
