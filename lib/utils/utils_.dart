import 'dart:math';

import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:flutter/material.dart';

InputDecoration dropdownInputDecoration(String hintText) => InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: ExpenseTrackerColors.violet,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: ExpenseTrackerColors.light60,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: ExpenseTrackerColors.light60,
        ),
      ),
      hintText: hintText,
      hintStyle: ExpenseTrackerTextStyle.body2.copyWith(
        color: ExpenseTrackerColors.light20,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
    );

// is dark mode
bool isDarkMode(BuildContext context) {
  final theme = Theme.of(context);
  return theme.brightness == Brightness.dark;
}

// const subscriptionsFrequency = [
//   'Daily',
//   'Weekly',
//   'Monthly',
//   'Yearly',
//   // 'Lifetime',
// ];

/// Generate a random color
Color generatingRandomColor() =>
    Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

//! FIX: get date from Date
String getHumanReadableDate(DateTime date) {
  if (date == null) return '';
  // if today then return today
  if (date.day == DateTime.now().day &&
      date.month == DateTime.now().month &&
      date.year == DateTime.now().year) {
    return 'Today';
  } else if (date.day == DateTime.now().day - 1 &&
      date.month == DateTime.now().month &&
      date.year == DateTime.now().year) {
    return 'Yesterday';
  }
  return '${date.day}/${date.month}/${date.year}';
}
