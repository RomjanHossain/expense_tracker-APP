import 'package:drift/drift.dart';

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()(); // Auto-incrementing ID
  RealColumn get amount => real()(); // Nullable amount
  RealColumn get spent => real()(); // Default spent is 0

  // Automatically computed remaining amount
  RealColumn get remaining => real().generatedAs(amount - spent)();
  TextColumn get category => text()(); // Nullable category ID
  RealColumn get percentage => real().nullable()(); // Nullable if needed
  BoolColumn get isRepeat => boolean().nullable()(); // Nullable repeat flag
  DateTimeColumn get createdDate => dateTime()(); // Nullable creation date
}
