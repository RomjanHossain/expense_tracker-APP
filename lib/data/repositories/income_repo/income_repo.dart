import 'package:expense_tracker/data/models/isar_entity/income_entity/income_entity.dart';

abstract class IncomeRepo {
  //NOTE: get list of income
  Future<List<IncomeIsarEntity>> getListOfIncome();
  //NOTE: create an income
  Future<int> createAnIncome(IncomeIsarEntity incomeEntity);
  //NOTE: delete an income
  Future<bool> deleteAnIncome(int id);
  //NOTE: update the income
  Future<int> updateTheIncome(int id, IncomeIsarEntity incomeEntity);
}
