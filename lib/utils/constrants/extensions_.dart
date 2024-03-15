//! Exention on segmentedbuttonsdata
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

//! INFO: on datetime to convert datetime to double
extension DateTimeX on DateTime {
  double get toDouble {
    debugPrint('${year}');
    debugPrint(
      'DateTime: ${(year + month + day) / 1000 + (hour + minute + second) / 100}',
    );
    // return millisecondsSinceEpoch.toDouble();
    // return hour + minute + second.toDouble();
    return (year + month + day) / 1000 + (hour + minute + second) / 100;
  }

//INFO: for week
  double get toDoubleW {
    return day.toDouble();
  }

//INFO: for today
  double get toDoubleT {
    debugPrint(
      '${hour * 3600 + minute * 60 + second / 10}',
    );
    return (hour * 3600 + minute * 60 + second) / 10;
  }

//INFO: is this week
  bool get isThisWeek {
    final now = DateTime.now();
    final start = now.subtract(Duration(days: now.weekday));
    final end = start.add(Duration(days: 7));
    return isAfter(start) && isBefore(end);
  }

//INFO: is this month
  bool get isThisMonth {
    final now = DateTime.now();
    return month == now.month;
  }

// INFO: is this year
  bool get isThisYear {
    final now = DateTime.now();
    return year == now.year;
  }
}
