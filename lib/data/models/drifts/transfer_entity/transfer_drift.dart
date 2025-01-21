import 'package:drift/drift.dart';
import 'package:expense_tracker/data/models/drifts/create_account/create_ac_drift.dart';

class Transfers extends Table {
  IntColumn get id => integer().autoIncrement()(); // Auto-incrementing ID
  RealColumn get amount => real().nullable()(); // Nullable transfer amount
  Column<int> get fromId => integer().references(Accounts, #id)();
  TextColumn get description => text().nullable()(); // Nullable description
  TextColumn get to => text().nullable()(); // Nullable target information
  TextColumn get attachment => text().nullable()(); // Nullable attachment
  DateTimeColumn get createdDate =>
      dateTime().nullable()(); // Nullable creation date
}
