import 'package:drift/drift.dart';
import 'package:expense_tracker/data/models/drifts/create_account/create_ac_drift.dart';

class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()(); // Auto-incrementing ID
  RealColumn get amount => real()(); // Nullable amount
  TextColumn get description => text().nullable()(); // Nullable description
  // IntColumn get walletId => integer()(); // Nullable wallet ID
  Column<int> get walletId => integer().references(Accounts, #id)();
  TextColumn get categoryId => text()(); // Nullable category ID
  TextColumn get attachment => text().nullable()(); // Nullable attachment
  BoolColumn get isRepeat => boolean().nullable()(); // Nullable repeat flag
  TextColumn get repeatType => text().nullable()(); // Nullable repeat type
  DateTimeColumn get startDate =>
      dateTime().nullable()(); // Nullable start date
  DateTimeColumn get endDate => dateTime().nullable()(); // Nullable end date
  DateTimeColumn get createdDate =>
      dateTime().nullable()(); // Nullable creation date
}
