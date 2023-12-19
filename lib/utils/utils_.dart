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
    textColor: Colors.white,
    fontSize: 16,
  );
}
