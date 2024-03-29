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
