import 'package:isar/isar.dart';
part 'income_entity.g.dart';

@collection
class IncomeIsarEntity {
  Id id = Isar.autoIncrement;
  double? ammount;
  String? description;
  int? walletId;
  String? attachment;
  bool? isRepeat;
  String? repeatType;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdDate;
}
