import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/core/utils/constrants/expense_category_tracker_.dart';
import 'package:expense_tracker/core/utils/utils_.dart';
import 'package:expense_tracker/data/datasources/local/category/category_local_data.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';

part 'idata_from_i_emodel.dart';

/// {@template data_from_i_emodel}
/// DataFromIEmodel description
/// {@endtemplate}
class DataFromIEmodel implements IDataFromIEmodel {
  const DataFromIEmodel._();

  /// {@macro data_from_i_emodel}
  static const DataFromIEmodel instance = DataFromIEmodel._();

  double getAmmount(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        return data.income?.ammount ?? 0.0;
      case ExpenseType.expense:
        return data.expense?.ammount ?? 0.0;
      case ExpenseType.transfer:
        return data.transfer?.ammount ?? 0.0;
    }
  }

  String getCategory(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        final income = data.income;
        if (income != null) {
          return ExpenseTrackerCategories.incomeMethods
              .firstWhere(
                (element) => element.id == income.categoryID,
              )
              .title;
        } else {
          return 'No category';
        }
      case ExpenseType.expense:
        final expense = data.expense;
        if (expense != null) {
          return categoryLocalData2
              .firstWhere(
                (element) => element.id == expense.categoryID,
              )
              .title;
        } else {
          return 'No category';
        }
      case ExpenseType.transfer:
        final transfer = data.transfer;
        if (transfer != null) {
          return transfer.to ?? 'Unknown Person';
        } else {
          return 'Unknown Person';
        }
    }
  }

  String getDate(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        return getHumanReadableDate(
          data.income?.createdDate ?? DateTime.now(),
        );
      case ExpenseType.expense:
        return getHumanReadableDate(
          data.expense?.createdDate ?? DateTime.now(),
        );
      case ExpenseType.transfer:
        return getHumanReadableDate(
          data.transfer?.createdDate ?? DateTime.now(),
        );
    }
  }

  String getDate2(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        return getHumanReadableDate2(
          data.income?.createdDate ?? DateTime.now(),
        );
      case ExpenseType.expense:
        return getHumanReadableDate2(
          data.expense?.createdDate ?? DateTime.now(),
        );
      case ExpenseType.transfer:
        return getHumanReadableDate2(
          data.transfer?.createdDate ?? DateTime.now(),
        );
    }
  }

  String getDescription(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        return data.income?.description ?? '';
      case ExpenseType.expense:
        return data.expense?.description ?? '';
      case ExpenseType.transfer:
        return data.transfer?.description ?? '';
    }
  }

  String getTitle(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        final income = data.income;
        if (income != null) {
          return ExpenseTrackerCategories.incomeMethods
              .firstWhere(
                (element) => element.id == income.categoryID,
              )
              .title;
        } else {
          return 'No category';
        }

      case ExpenseType.expense:
        final expense = data.expense;
        if (expense != null) {
          return categoryLocalData2
              .firstWhere(
                (element) => element.id == expense.categoryID,
              )
              .title;
        } else {
          return 'No category';
        }
      case ExpenseType.transfer:
        final transfer = data.transfer;
        if (transfer != null) {
          return transfer.to ?? 'Unknown Person';
        } else {
          return 'Unknown Person';
        }
    }
  }

  String getIcon(IEmodel data) {
    switch (data.isIncome) {
      case ExpenseType.income:
        final income = data.income;
        if (income != null) {
          return ExpenseTrackerCategories.incomeMethods
              .firstWhere(
                (element) => element.id == income.categoryID,
              )
              .icon;
        } else {
          return '💰';
        }

      case ExpenseType.expense:
        final expense = data.expense;
        if (expense != null) {
          return categoryLocalData2
              .firstWhere(
                (element) => element.id == expense.categoryID,
              )
              .icon;
        } else {
          return '💸';
        }
      case ExpenseType.transfer:
        return '🔁';
    }
  }
}
