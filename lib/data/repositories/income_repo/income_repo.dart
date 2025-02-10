import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/data/models/drifts/income_entity/income_drift.dart';

abstract class IncomeRepo {
  //NOTE: get list of income
  Future<List<Incomes>> getListOfIncome();
  //NOTE: create an income
  Future<int> createAnIncome(Incomes incomeEntity);
  //NOTE: delete an income
  Future<bool> deleteAnIncome(int id);
  //NOTE: update the income
  Future<int> updateTheIncome(int id, IncomesCompanion incomeEntity);
}
