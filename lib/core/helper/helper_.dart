import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

/// show success toast
ToastificationItem showSuccessToast(BuildContext context, String message) {
  return toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    title: const Text('Success'),
    description: Text(message),
    autoCloseDuration: 4.seconds,
    borderRadius: BorderRadius.circular(12.r),
    boxShadow: lowModeShadow,
    alignment: Alignment.bottomCenter,
    pauseOnHover: false,
    showProgressBar: false,
    primaryColor: ExpenseTrackerColors.green,
  );
}

/// show failure toast
ToastificationItem showFailureToast(BuildContext context, String message) {
  return toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    // borderRadius: 20.r,
    title: const Text('Failure'),
    description: Text(message),
    autoCloseDuration: 4.seconds,
    borderRadius: BorderRadius.circular(12.r),
    boxShadow: lowModeShadow,
    showProgressBar: false,
    pauseOnHover: false,
    alignment: Alignment.bottomCenter,
    primaryColor: ExpenseTrackerColors.red,
  );
}
