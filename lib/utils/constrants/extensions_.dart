//! Exention on segmentedbuttonsdata
import 'package:expense_tracker/utils/constrants/enums_.dart';

/// Extension
extension SegmentedButtonsDataX on SegmentedButtonsData {
  String get name {
    switch (this) {
      case SegmentedButtonsData.today:
        return 'Today';
      case SegmentedButtonsData.week:
        return 'Week';
      case SegmentedButtonsData.month:
        return 'Month';
      case SegmentedButtonsData.year:
        return 'Year';
    }
  }
}

//! extension for subscriptionsFrequency
extension SubscriptionsFrequencyX on SubscriptionsFrequency {
  String get name {
    switch (this) {
      case SubscriptionsFrequency.daily:
        return 'Daily';
      case SubscriptionsFrequency.weekly:
        return 'Weekly';
      case SubscriptionsFrequency.monthly:
        return 'Monthly';
      case SubscriptionsFrequency.yearly:
        return 'Yearly';
    }
  }
}

//! ext for ExpenseType
extension ExpenseTypeX on ExpenseType {
  String get name {
    switch (this) {
      case ExpenseType.income:
        return 'Income';
      case ExpenseType.expense:
        return 'Expense';
      case ExpenseType.transfer:
        return 'Transfer';
    }
  }
}

//! NOTE: SortType string
extension SortTypeX on SortType {
  String get name {
    switch (this) {
      case SortType.highest:
        return 'Highest';
      case SortType.lowest:
        return 'Lowest';
      case SortType.newest:
        return 'Newest';
      case SortType.oldest:
        return 'Oldest';
    }
  }
}
