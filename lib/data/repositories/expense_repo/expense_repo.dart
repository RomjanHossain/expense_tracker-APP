import 'package:expense_tracker/data/models/isar_entity/expense_entity/expense_entity.dart';

abstract class ExpenseRepo {
  //NOTE: get list of expense
  Future<List<ExpenseIsarEntity>> getListOfExpense();
  //NOTE: create an expense
  Future<int> createAnExpense(ExpenseIsarEntity expenseEntity);
  //NOTE: delete an expense
  Future<bool> deleteAnExpense(int id);
  //NOTE: update the expense
  Future<int> updateTheExpense(int id, ExpenseIsarEntity expenseEntity);
}
