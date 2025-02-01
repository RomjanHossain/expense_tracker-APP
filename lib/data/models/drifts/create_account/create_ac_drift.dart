import 'package:drift/drift.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()(); // Auto-incrementing ID
  TextColumn get accountName => text()(); // Nullable account name
  RealColumn get accountBalance => real()(); // Nullable account balance
  IntColumn get accountType => intEnum<AccountType>()(); // Enum stored as int
  TextColumn get accountTypeImg => text().nullable()(); // Nullable image path
}
