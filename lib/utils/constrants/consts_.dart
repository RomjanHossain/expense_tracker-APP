import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 10h Height
final height10 = SizedBox(height: 10.h);
// 20h Height
final height20 = SizedBox(height: 20.h);
// 30h Height
final height30 = SizedBox(height: 30.h);

// 10w Width
final width10 = SizedBox(width: 10.w);
// 20w Width
final width20 = SizedBox(width: 20.w);
// 30w Width
final width30 = SizedBox(width: 30.w);

String getSegemtedButtonText(SegmentedButtonsData se) {
  switch (se) {
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

///& types of expenses enum (income, expense, transfer)

String getSucriptionFrequencyText(SubscriptionsFrequency se) {
  switch (se) {
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
