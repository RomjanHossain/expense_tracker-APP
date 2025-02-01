import 'package:drift/drift.dart';
import 'package:expense_tracker/core/helper/custom_types.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';

abstract class BudgetTblUsecases {
  // create budget
  ResultFuture<int> setBudget(Insertable<Budget> pd);
  // budget UPDATE
  Future<bool> updateBudget({
    required int id,
    double? amount,
    double? spent = 0,
    String? category,
    bool? isAlert,
    double? percentage,
  });
  // detele budget
  Future<int> deleteBudget(int id);
  // get all budgets
  Future<List<Budget>> getAllBudgets();
  // get budgets (current month)
  Future<List<Budget>> getBudgets(int month);
}
