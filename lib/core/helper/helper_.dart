import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg, [Color? color]) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color ?? ExpenseTrackerColors.white,
    textColor: color != null ? ExpenseTrackerColors.white : Colors.black,
  );
}
