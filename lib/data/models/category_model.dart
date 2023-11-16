import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/material.dart';

/// category model for the dropdowns
class CategoryModel {
  CategoryModel({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

class ExpenseTrackerCategories {
  const ExpenseTrackerCategories._();

  /// list of categories of expenseMethods
  static List<CategoryModel> categoryExpenseMethods = expenseMethods
      .map((e) => CategoryModel(title: e.$1, icon: e.$2))
      .toList();

  /// list of all the expenseCategories
  static List<CategoryModel> expenseCategoriesMethod = expenseCategories
      .map((e) => CategoryModel(title: e.$1, icon: e.$2))
      .toList();
}
