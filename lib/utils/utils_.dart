import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// show toast without context

void showToast(String msg, Color? color) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color,
    textColor: ExpenseTrackerColors.light,
    fontSize: 16,
  );
}

InputDecoration dropdownInputDecoration(String hintText) => InputDecoration(
      isDense: true,
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
