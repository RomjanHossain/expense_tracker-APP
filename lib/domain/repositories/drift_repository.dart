import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:expense_tracker/core/error/exceptions.dart';
import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';

class DriftRepository {
  // Public factory to access the singleton instance
  factory DriftRepository() => _instance;

  // Private constructor
  DriftRepository._internal(this._db);
  // Singleton instance
  static final DriftRepository _instance =
      DriftRepository._internal(AppDatabase());
  // The database instance
  final AppDatabase _db;

  Future<int> createIncome(Income income) async {
    final wallet = await (_db.select(_db.accounts)
          ..where((tbl) => tbl.id.equals(income.walletId)))
        .getSingle();
    final newBalance = (wallet.accountBalance) + (income.amount);
    await (_db.update(_db.accounts)..where((tbl) => tbl.id.equals(wallet.id)))
        .write(AccountsCompanion(accountBalance: Value(newBalance)));
    return _db.into(_db.incomes).insert(income);
  }

  Future<List<Transfer>> getTodaysTransfer() async {
    final today = DateTime.now();
    return (_db.select(_db.transfers)
          ..where(
            (tbl) =>
                tbl.createdDate.day.equals(today.day) &
                tbl.createdDate.month.equals(today.month),
          ))
        .get();
  }

  // get user
  ResultFutureOrException<ProfileData> getUser() async {
    try {
      return Left(await _db.profile.select().getSingle());
    } catch (e) {
      return Right(UserNotExistsException());
    }
  }

  // set user
  ResultFuture<int> setUser(Insertable<ProfileData> pd) async {
    try {
      return _db.profile.insertOne(pd);
    } catch (e) {
      return -1;
    }
  }

  // update user
  Future<bool> updateUser(String pin) async {
    try {
      // Fetch the first profile row (if exists)
      final query = await _db.profile.select().getSingleOrNull();
      if (query == null) {
        print('No user found to update');
        return false;
      }

      // Update the `pin` column for the row with the fetched `id`
      await (_db.update(_db.profile)..where((tbl) => tbl.id.equals(query.id)))
          .write(ProfileCompanion(pin: Value(pin)));

      return true;
    } catch (e) {
      // Log the error for debugging
      print('Error updating user: $e');
      return false;
    }
  }

  Future<double> getTotalExpense(int month) async {
    final query = await (_db.select(_db.expenses)
          ..where((tbl) => tbl.createdDate.month.equals(month)))
        .get();
    return query.fold<double>(
      0,
      (prev, element) => prev + (element.amount),
    );
  }

  // Methods for database operations
  Future<double> getTotalIncome(int month) async {
    final query = await (_db.select(_db.incomes)
          ..where((tbl) => tbl.createdDate.month.equals(month)))
        .get();
    return query.fold<double>(
      0,
      (prev, element) => prev + (element.amount),
    );
  }

  /// Insert a record into any table
  Future<int> insertRecord<T extends Table, D extends DataClass>(
    TableInfo<T, D> table,
    Insertable<D> record,
  ) async {
    return _db.into(table).insert(record);
  }

  /// Update a record in any table
  Future<bool> updateRecord<T extends Table, D extends DataClass>(
    TableInfo<T, D> table,
    Insertable<D> record,
  ) async {
    return _db.update(table).replace(record);
  }

  /// Delete a record in any table
  Future<int> deleteRecord<T extends Table, D extends DataClass>(
    TableInfo<T, D> table,
    Insertable<D> record,
  ) async {
    return _db.delete(table).delete(record);
  }

  /// Fetch all records from a table
  Future<List<D>> fetchAllRecords<T extends Table, D extends DataClass>(
    TableInfo<T, D> table,
  ) async {
    return _db.select(table).get();
  }

  /// Count the total number of rows in a table
  Future<int> countRows<T extends Table, D extends DataClass>(
    TableInfo<T, D> table,
  ) async {
    final countExp = _db
        .customSelect('SELECT COUNT(*) AS count FROM ${table.actualTableName}');
    final result = await countExp.getSingle();
    return result.data['count'] as int;
  }

  Future<int> clearTable<T extends Table, D extends DataClass>(
    TableInfo<T, D> table,
  ) async {
    return _db.delete(table).go();
  }
}
