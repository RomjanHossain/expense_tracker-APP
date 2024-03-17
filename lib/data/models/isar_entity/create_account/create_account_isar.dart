import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:isar/isar.dart';
part 'create_account_isar.g.dart';

@collection
class AccountEntity {
  Id id = Isar.autoIncrement;
  String? accountName;
  double? accountBalance;
  @enumerated
  late AccountType accountType;
  String? accountTypeImg;
}
