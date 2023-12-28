import 'package:expense_tracker/data/datasources/local/utils_data/account_type_helper.dart';
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
  // final String acName;
  // final AccountType acType;
  // final double acBalance;
  // final String? acLogo;

  // CreateAccountEntity copyWith({
  //   String? acName,
  //   AccountType? acType,
  //   double? acBalance,
  //   String? acLogo,
  // }) {
  //   return CreateAccountEntity(
  //     acName: acName ?? this.acName,
  //     acType: acType ?? this.acType,
  //     acBalance: acBalance ?? this.acBalance,
  //     acLogo: acLogo ?? this.acLogo,
  //   );
  // }

  // @override
  // List<Object?> get props => [
  //   acName,
  //   acType,
  //   acBalance,
  //   acLogo,
  // ];
}
