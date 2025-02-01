import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_entity.freezed.dart';

@freezed
class CreateAccountEntity with _$CreateAccountEntity {
  const factory CreateAccountEntity({
    required String acName,
    required AccountType? acType,
    required double acBalance,
    String? acLogo,
  }) = _CreateAccountEntity;
}
