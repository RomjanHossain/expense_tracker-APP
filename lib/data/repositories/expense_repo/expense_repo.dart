import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';

abstract class ExpenseRepo {
  //NOTE: get list of expense
  Future<List<Expense>> getListOfExpense();
  //NOTE: create an expense
  Future<int> createAnExpense(Expense expenseEntity);
  //NOTE: delete an expense
  Future<bool> deleteAnExpense(int id);
  //NOTE: update the expense
  Future<int> updateTheExpense(int id, ExpensesCompanion expenseEntity);
}
