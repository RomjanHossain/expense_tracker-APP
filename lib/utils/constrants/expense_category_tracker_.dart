import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/utils/constrants/categories_data_.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/cupertino.dart';

class ExpenseTrackerCategories {
  const ExpenseTrackerCategories._();

  /// list of categories of expenseMethods
  static List<CategoryModel> categoryExpenseMethods = expenseMethods
      .map(
        (Map<int, (String, IconData)> e) => CategoryModel(
          title: e.values.first.$1,
          icon: e.values.first.$2,
          id: e.keys.first,
        ),
      )
      .toList();
  // expense methods
  static CategoryModel singleExpenseMethod(int i) => categoryExpenseMethods[i];

  /// list of all the expenseCategories
  static List<CategoryModel> expenseCategoriesMethod = categoryData
      .map((key, value) => null)
      // .map(
      //   (e) => CategoryModel(
      //     title: e.values.first.$1,
      //     icon: e.values.first.$2,
      //     id: e.keys.first,
      //   ),
      // )
      .toList();

  // expense categories
  static CategoryModel singleExpenseCategory(int i) =>
      expenseCategoriesMethod[i];
}

extension on Map<int, (String, IconData)> {
  int get id => keys.first;
  String get $1 => values.first.$1;
  IconData get $2 => values.first.$2;

  CategoryModel get toCategoryModel => CategoryModel(
        title: $1,
        icon: $2,
        id: id,
      );
}
