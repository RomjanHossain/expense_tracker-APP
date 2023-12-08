// CURD operation abstracts
import 'package:expense_tracker/domain/entities/expense_entity.dart';

abstract class ExpensesRepo {
  // Delete
  Future<bool> deleteExpenseRecord(int id);
  // Create
  Future<bool> createExpenseRecord(ExpenseEntity ee);
  // Update
  Future<bool> updateExpenseRecord(ExpenseEntity ee, int id);
  // read by id
  Future<ExpenseEntity?> getExpenseRecord(int id);
}
