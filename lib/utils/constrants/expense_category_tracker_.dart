import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/data/datasources/local/category/incomes_local_db.dart';
import 'package:expense_tracker/data/models/category_model.dart';
// import 'package:expense_tracker/utils/constrants/consts_.dart';
// import 'package:flutter/cupertino.dart';

class ExpenseTrackerCategories {
  const ExpenseTrackerCategories._();

  /// list of categories of expenses only Headers
  static List<CategoryModel> expensesCategories = categoryLocalData2;
  static CategoryModel? singleexpensesCategory(String key) =>
      categoryLocalData2.where((element) => element.id == key).firstOrNull;
  // income methods
  static List<CategoryModel> incomeMethods = incomeLocalData;
  // single income methods from id
  static CategoryModel? singleIncomeMethods(String id) =>
      incomeLocalData.where((element) => element.id == id).firstOrNull;
}
