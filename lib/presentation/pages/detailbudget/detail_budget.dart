import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/widgets/amount_progress_indicator.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/presentation/widgets/category_with_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBudget extends StatelessWidget {
  const DetailBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Budget'),
        centerTitle: true,
        actions: [
          // delete
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.delete,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryWithBorder(
                      color: ExpenseTrackerColors.blue,
                      title: 'Subscription',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Remaining',
                    style: ExpenseTrackerTextStyle.title2.copyWith(
                      color: ExpenseTrackerColors.dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  r'$100',
                  style: ExpenseTrackerTextStyle.titleX.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ExpenseTrackerColors.dark,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: AmountProgressIndicator(
                    color: ExpenseTrackerColors.yellow,
                    value: 0.8,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ExpenseTrackerColors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: ExpenseTrackerColors.light,
                      ),
                      SizedBox(width: 10.w),
                      const Text(
                        'You’ve exceed the limit',
                        style: TextStyle(
                          color: ExpenseTrackerColors.light,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            PrimaryButton(onPress: () {}, text: 'Edit'),
          ],
        ),
      ),
    );
  }
}
