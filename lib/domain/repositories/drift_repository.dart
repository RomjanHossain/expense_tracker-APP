import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:expense_tracker/core/error/exceptions.dart';
import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/usecases/account_tbl_usecases.dart';
import 'package:expense_tracker/domain/usecases/budget_usecases.dart';
import 'package:expense_tracker/domain/usecases/user_tbl_usecases.dart';
import 'package:flutter/rendering.dart';

class DriftRepository
    implements AccountTblUsecases, UserTblUsecases, BudgetTblUsecases {
  // Public factory to access the singleton instance
  factory DriftRepository() => _instance;

  // Private constructor
  DriftRepository._internal(this._db);
  // Singleton instance
  static final DriftRepository _instance =
      DriftRepository._internal(AppDatabase());
  // The database instance
  final AppDatabase _db;

  // ------------------------- ACCOUNTS -----------------

  // get list of all accounts
  @override
  Future<List<Account>> getListOfAccount() async {
    return _db.select(_db.accounts).get();
  }

  // open an account
  @override
  Future<int> openAnAccount(AccountsCompanion account) async {
    return _db.into(_db.accounts).insert(account);
  }

  // update account balance
  @override
  Future<void> updateAccountBalance(int walletID, double newBalance) async {
    await (_db.update(_db.accounts)..where((tbl) => tbl.id.equals(walletID)))
        .write(AccountsCompanion(accountBalance: Value(newBalance)));
    return;
  }

  // get account from the table from ID
  @override
  Future<Account> getSingleAccount(int walletID) async {
    return (_db.select(_db.accounts)..where((tbl) => tbl.id.equals(walletID)))
        .getSingle();
  }

  // ------------------------- CREATING (income/expense/transfer) -----------------

  /// create an income and also update the account (wallet) balance
  Future<int> createIncome(IncomesCompanion income) async {
    final wallet = await getSingleAccount(income.walletId.value);
    final newBalance = (wallet.accountBalance) + (income.amount.value);
    await updateAccountBalance(wallet.id, newBalance);
    return _db.into(_db.incomes).insert(income);
  }

  /// create a transfer and also update the account (wallet) balance
  Future<int> createTransfer(TransfersCompanion transfer) async {
    final wallet = await getSingleAccount(transfer.fromId.value);
    final newBalance = (wallet.accountBalance) - (transfer.amount.value);
    await updateAccountBalance(wallet.id, newBalance);
    return _db.into(_db.transfers).insert(transfer);
  }

  /// create an expense and also update the account (wallet) balance
  Future<int> createExpense(ExpensesCompanion expense) async {
    final wallet = await getSingleAccount(expense.walletId.value);
    final newBalance = (wallet.accountBalance) - (expense.amount.value);
    await updateAccountBalance(wallet.id, newBalance);
    return _db.into(_db.expenses).insert(expense);
  }

  // ------------------------- Get Yesterday's (income/expense/transfer) -----------------

// Get yesterday's transfers
  Future<List<Transfer>> getYestTransfer() async {
    final today = DateTime.now();
    final startOfYesterday = DateTime(today.year, today.month, today.day)
        .subtract(const Duration(days: 1));
    final endOfYesterday =
        DateTime(today.year, today.month, today.day, 23, 59, 59)
            .subtract(const Duration(days: 1));

    final query = _db.select(_db.transfers)
      ..where(
        (tbl) =>
            tbl.createdDate.isBetweenValues(startOfYesterday, endOfYesterday),
      );

    return query.get();
  }

  // Get yesterday's income
  Future<List<Income>> getYestIncome() async {
    final today = DateTime.now();
    final startOfYesterday = DateTime(today.year, today.month, today.day)
        .subtract(const Duration(days: 1));
    final endOfYesterday =
        DateTime(today.year, today.month, today.day, 23, 59, 59)
            .subtract(const Duration(days: 1));

    final query = _db.select(_db.incomes)
      ..where(
        (tbl) =>
            tbl.createdDate.isBetweenValues(startOfYesterday, endOfYesterday),
      );

    return query.get();
  }

  // Get yesterday's expenses
  Future<List<Expense>> getYestExpense() async {
    final today = DateTime.now();
    final startOfYesterday = DateTime(today.year, today.month, today.day)
        .subtract(const Duration(days: 1));
    final endOfYesterday =
        DateTime(today.year, today.month, today.day, 23, 59, 59)
            .subtract(const Duration(days: 1));

    final query = _db.select(_db.expenses)
      ..where(
        (tbl) =>
            tbl.createdDate.isBetweenValues(startOfYesterday, endOfYesterday),
      );

    return query.get();
  }

  // ------------------------- Get Todays's (income/expense/transfer) -----------------

  // Get today's transfers
  Future<List<Transfer>> getTodaysTransfer() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = DateTime(today.year, today.month, today.day, 23, 59, 59);
    final t = _db.select(_db.transfers)
      ..where((tbl) => tbl.createdDate.isBetweenValues(startOfDay, endOfDay));
    return t.get();
  }

  // Get today's income
  Future<List<Income>> getTodaysIncome() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = DateTime(today.year, today.month, today.day, 23, 59, 59);
    final i = _db.select(_db.incomes)
      ..where((tbl) => tbl.createdDate.isBetweenValues(startOfDay, endOfDay));
    return i.get();
  }

  // Get today's expenses
  Future<List<Expense>> getTodaysExpense() async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = DateTime(today.year, today.month, today.day, 23, 59, 59);
    final e = _db.select(_db.expenses)
      ..where((tbl) => tbl.createdDate.isBetweenValues(startOfDay, endOfDay));
    return e.get();
  }

  // ------------------------- Get This Week's (income/expense/transfer) -----------------

  // Get week's income
  Future<List<Income>> getWeeksIncome() async {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek
        .add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));

    final i = _db.select(_db.incomes)
      ..where((tbl) => tbl.createdDate.isBetweenValues(startOfWeek, endOfWeek));
    return i.get();
  }

  // Get week's transfers
  Future<List<Transfer>> getWeeksTransfer() async {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek
        .add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));

    final t = _db.select(_db.transfers)
      ..where((tbl) => tbl.createdDate.isBetweenValues(startOfWeek, endOfWeek));
    return t.get();
  }

  // Get week's expenses
  Future<List<Expense>> getWeeksExpense() async {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek
        .add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));

    final e = _db.select(_db.expenses)
      ..where((tbl) => tbl.createdDate.isBetweenValues(startOfWeek, endOfWeek));
    return e.get();
  }

  // ------------------------- Get This Month's (income/expense/transfer) -----------------

  // Get this month's transfers
  Future<List<Transfer>> getMonthsTransfer() async {
    final today = DateTime.now();
    return (_db.select(_db.transfers)
          ..where(
            (tbl) =>
                tbl.createdDate.year.equals(today.year) &
                tbl.createdDate.month.equals(today.month),
          ))
        .get();
  }

  // Get month's income
  Future<List<Income>> getMonthsIncome() async {
    final today = DateTime.now();
    return (_db.select(_db.incomes)
          ..where(
            (tbl) =>
                tbl.createdDate.year.equals(today.year) &
                tbl.createdDate.month.equals(today.month),
          ))
        .get();
  }

  // Get month's expenses
  Future<List<Expense>> getMonthsExpense() async {
    final today = DateTime.now();

    return (_db.select(_db.expenses)
          ..where(
            (tbl) =>
                tbl.createdDate.year.equals(today.year) &
                tbl.createdDate.month.equals(today.month),
          ))
        .get();
  }

  // ------------------------- Get This Year's (income/expense/transfer) -----------------

  // Get year's income
  Future<List<Income>> getYearsIncome() async {
    final today = DateTime.now();
    final q = _db.select(_db.incomes)
      ..where((tbl) => tbl.createdDate.year.equals(today.year));
    return q.get();
  }

  // Get year's transfer
  Future<List<Transfer>> getYearsTransfer() async {
    final today = DateTime.now();
    final q = _db.select(_db.transfers)
      ..where((tbl) => tbl.createdDate.year.equals(today.year));
    return q.get();
  }

  // Get year's expense
  Future<List<Expense>> getYearsExpense() async {
    final today = DateTime.now();
    final q = _db.select(_db.expenses)
      ..where((tbl) => tbl.createdDate.year.equals(today.year));
    return q.get();
  }

  // ------------------------- Delete (income/expense/transfer) -----------------

  // delete income
  Future<int> deletIncome(int id) async {
    final r = _db.delete(_db.incomes)..where((tbl) => tbl.id.equals(id));
    return r.go();
  }

  // delete expense
  Future<int> deletExpense(int id) async {
    final r = _db.delete(_db.expenses)..where((tbl) => tbl.id.equals(id));
    return r.go();
  }

  // delete income
  Future<int> deletTransfer(int id) async {
    final r = _db.delete(_db.transfers)..where((tbl) => tbl.id.equals(id));
    return r.go();
  }

  // ------------------------- Users -----------------

  // get user
  @override
  ResultFutureOrException<ProfileData> getUser() async {
    try {
      final users = await _db.profile.select().get();
      final last = users.last;

      debugPrint('last User: ${last.name}');
      debugPrint('last User: ${last.pin}');
      debugPrint('last User: ${last.id}');
      debugPrint('last User: ${last.imageUrl}');
      return Left(last);
    } catch (e) {
      return Right(UserNotExistsException());
    }
  }

  // set user
  @override
  ResultFuture<int> setUser(Insertable<ProfileData> pd) async {
    try {
      return _db.profile.insertOne(pd);
    } catch (e) {
      return -1;
    }
  }

  // update user
  @override
  Future<bool> updateUser(String pin) async {
    try {
      // Fetch the first profile row (if exists)
      final query = await _db.profile.select().getSingleOrNull();
      if (query == null) {
        return false;
      }

      // Update the `pin` column for the row with the fetched `id`
      await (_db.update(_db.profile)..where((tbl) => tbl.id.equals(query.id)))
          .write(ProfileCompanion(pin: Value(pin)));

      return true;
    } catch (e) {
      // Log the error for debugging
      return false;
    }
  }

  // ------------------------- Balance's -----------------

  //NOTE: total account balance(monthly)
  // Future<double> getMonthlyBalance(int month) async {
  //   try {
  //     final totalTransfers = await getMonthlyTransfer(month);
  //     final totalIncomes = await getMonthlyIncome(month);
  //     final totalExpenses = await getMonthlyExpense(month);

  //     final monthlyBalance = (totalIncomes + totalTransfers) - totalExpenses;

  //     return monthlyBalance;
  //   } catch (e) {
  //     debugPrint('Error in getMonthlyBalance: $e');
  //     return 0.0;
  //   }
  // }

  // monthly income
  Future<double> getMonthlyIncome(int month) async {
    final today = DateTime.now();
    final allIncomes = await (_db.select(_db.incomes)
          ..where(
            (tbl) =>
                tbl.createdDate.year.equals(today.year) &
                tbl.createdDate.month.equals(month),
          ))
        .get();
    final totalIncomes = allIncomes.fold<double>(
      0,
      (previous, income) => previous + income.amount,
    );
    return totalIncomes;
  }

  // monthly transfer
  Future<double> getMonthlyTransfer(int month) async {
    final today = DateTime.now();
    final allTransfers = await (_db.select(_db.transfers)
          ..where(
            (tbl) =>
                tbl.createdDate.year.equals(today.year) &
                tbl.createdDate.month.equals(month),
          ))
        .get();

    final totalTransfers = allTransfers.fold<double>(
      0,
      (previous, transfer) => previous + transfer.amount,
    );
    return totalTransfers;
  }

  // monthly expenses
  Future<double> getMonthlyExpense(int month) async {
    final today = DateTime.now();
    final allExpenses = await (_db.select(_db.expenses)
          ..where(
            (tbl) =>
                tbl.createdDate.year.equals(today.year) &
                tbl.createdDate.month.equals(month),
          ))
        .get();
    final totalExpenses = allExpenses.fold<double>(
      0,
      (previous, transfer) => previous + transfer.amount,
    );
    return totalExpenses;
  }

  Future<double> getTotalBalance() async {
    try {
      final query = await _db.select(_db.accounts).get();
      // Sum up the account balances
      return query.fold<double>(
        0,
        (previous, element) => previous + element.accountBalance,
      );
    } catch (e) {
      // print('Error in getTotalBalanceMonthly: $e');
      return 0.0;
    }
  }

  // ------------------------- Useful methods -----------------

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

  // ------------------------- BUDGETS -----------------
  @override
  Future<int> deleteBudget(int id) async {
    final r = _db.delete(_db.budgets)..where((tbl) => tbl.id.equals(id));
    return r.go();
  }

  @override
  Future<List<Budget>> getAllBudgets() {
    final query = _db.select(_db.budgets);
    return query.get();
  }

  @override
  Future<List<Budget>> getBudgets(int month) {
    final today = DateTime.now();
    final query = _db.select(_db.budgets)
      ..where(
        (tbl) =>
            tbl.createdDate.year.equals(today.year) &
            tbl.createdDate.month.equals(month),
      );
    return query.get();
  }

  @override
  ResultFuture<int> setBudget(Insertable<Budget> pd) async {
    try {
      debugPrint('Creating budget: $pd');
      final query = _db.into(_db.budgets).insert(pd);
      debugPrint('Budget created: $query');
      return query;
    } catch (e) {
      debugPrint('Error creating budget: $e');
      return -1;
    }
  }

  @override
  Future<bool> updateBudget({
    required int id,
    double? amount,
    String? category,
    double? spent,
    bool? isAlert,
    double? percentage,
  }) async {
    try {
      final query = _db.update(_db.budgets)..where((tbl) => tbl.id.equals(id));

      // Create a single BudgetEntityCompanion object with updated values
      final updatedValues = BudgetsCompanion(
        amount: amount != null ? Value(amount) : const Value.absent(),
        spent: spent != null ? Value(spent) : const Value.absent(),
        category: category != null ? Value(category) : const Value.absent(),
        isRepeat: isAlert != null ? Value(isAlert) : const Value.absent(),
        percentage:
            percentage != null ? Value(percentage) : const Value.absent(),
      );

      final rowsUpdated = await query.write(updatedValues);

      return rowsUpdated > 0;
    } catch (e) {
      print('Error updating budget: $e');
      return false;
    }
  }
}
