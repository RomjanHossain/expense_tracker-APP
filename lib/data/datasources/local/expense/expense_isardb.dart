import 'package:isar/isar.dart';

part 'expense_isardb.g.dart';

@collection
class ExpenseLocalDB {
  Id id = Isar.autoIncrement;
  // income source (card,cash or anything else)
  String? incomeSource;
  // where the money were spent
  String? spentedON;
  // how much
  double? money;
  // any comment?
  String? comment;
  // when it was spent
  String? whenItWasSpent;
}
