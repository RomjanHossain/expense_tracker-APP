import 'package:expense_tracker/data/datasources/local/expense/expense_isardb.dart';
import 'package:expense_tracker/domain/entities/expense_entity.dart';
import 'package:expense_tracker/domain/repositories/expense_repo.dart';
import 'package:isar/isar.dart';

class ExpenseRepoImpl extends ExpensesRepo {
  ExpenseRepoImpl(this.database);
  final Isar database;
  @override
  Future<bool> createExpenseRecord(ExpenseEntity ee) async {
    final data = ExpenseLocalDB()
      ..money = ee.money
      ..comment = ee.comment
      ..spentedON = ee.spentedON
      ..incomeSource = ee.incomeSource
      ..whenItWasSpent = ee.whenItWasSpent;
    database.writeTxnSync(
      () => database.expenseLocalDBs.putSync(data),
    );

    return true;
  }

  @override
  Future<bool> deleteExpenseRecord(int id) async {
    final resp = database.expenseLocalDBs.deleteSync(id);
    if (resp) {
      // showSuccessToast(
      //   context,
      //   'Record Successfully Deleted',
      // );
    } else {
      // showToast(
      //   '500: Something went wrong',
      // );
    }
    return resp;
  }

  @override
  Future<ExpenseEntity?> getExpenseRecord(int id) async {
    final resp = database.expenseLocalDBs.getSync(id);
    if (resp == null) {
      // showToast('Getting record failed.');
      return null;
    }
    final data = ExpenseEntity(
      incomeSource: resp.incomeSource!,
      spentedON: resp.spentedON!,
      money: resp.money!,
      whenItWasSpent: resp.whenItWasSpent!,
      id: resp.id,
    );
    return data;
  }

  @override
  Future<void> updateExpenseRecord(ExpenseEntity ee, int id) async {
    final data = ExpenseLocalDB()
      ..money = ee.money
      ..comment = ee.comment
      ..spentedON = ee.spentedON
      ..incomeSource = ee.incomeSource
      ..whenItWasSpent = ee.whenItWasSpent;
    database.expenseLocalDBs.putSync(data);
  }
}
