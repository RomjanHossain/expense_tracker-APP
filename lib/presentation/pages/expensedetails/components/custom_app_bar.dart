import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/components/detail_center_card.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/components/sucess_alter.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({required this.expandedHeight, required this.ieModel});
  final double expandedHeight;
  final IEmodel ieModel;

  // get datetime
  String getDateTime() {
    switch (ieModel.isIncome) {
      case ExpenseType.income:
        return DateFormat("EEEE, d'th' MMMM yyyy, hh:mm a")
            .format(ieModel.income!.createdDate ?? DateTime.now());
      case ExpenseType.expense:
        return DateFormat("EEEE, d'th' MMMM yyyy, hh:mm a")
            .format(ieModel.expense!.createdDate ?? DateTime.now());
      case ExpenseType.transfer:
        return DateFormat("EEEE, d'th' MMMM yyyy, hh:mm a")
            .format(ieModel.transfer!.createdDate ?? DateTime.now());
    }
  }

  // payment
  // String? getCat() {
  //   if (ieModel.isIncome case ExpenseType.income) {

  //     return ieModel.income.walletId;
  //   } else if (ieModel.isIncome case ExpenseType.expense) {
  //     // return ieModel.expense?.categoryID ?? 'No Description';
  //     final s = ExpenseTrackerCategories.singleexpensesCategory(
  //       ieModel.expense?.categoryID ?? 'groceries',
  //     );
  //     return s;
  //   }
  //   return null;
  // }
// get cat
  CategoryModel? getCat() {
    if (ieModel.isIncome case ExpenseType.income) {
      final s = ExpenseTrackerCategories.singleIncomeMethods(
        ieModel.income?.categoryID ?? 'sideGig',
      );
      return s;
    } else if (ieModel.isIncome case ExpenseType.expense) {
      // return ieModel.expense?.categoryID ?? 'No Description';
      final s = ExpenseTrackerCategories.singleexpensesCategory(
        ieModel.expense?.categoryID ?? 'groceries',
      );
      return s;
    }
    return null;
  }

  // get color
  Color getColor() {
    switch (ieModel.isIncome) {
      case ExpenseType.expense:
        return ExpenseTrackerColors.red;
      case ExpenseType.income:
        return ExpenseTrackerColors.green;
      case ExpenseType.transfer:
        return ExpenseTrackerColors.blue;
    }
  }

  // get amount
  double getAmount() {
    switch (ieModel.isIncome) {
      case ExpenseType.income:
        return ieModel.income?.ammount ?? 0.0;
      case ExpenseType.expense:
        return ieModel.expense?.ammount ?? 0.0;
      case ExpenseType.transfer:
        return ieModel.transfer?.ammount ?? 0.0;
    }
  }

  // detail
  String getDetailCardSubtitle() {
    switch (ieModel.isIncome) {
      case ExpenseType.income:
        return 'Income';
      case ExpenseType.expense:
        return 'Expense';
      case ExpenseType.transfer:
        return 'Transfer';
    }
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        //INFO: nav back
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.r),
              bottomLeft: Radius.circular(20.r),
            ),
            color: getColor(),
          ),
          // transformAlignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: ExpenseTrackerColors.light,
            ),
          ),
        ),
        //INFO: delete button
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: IconButton(
              onPressed: () {
                // bottom modal sheet
                showModalBottomSheet<void>(
                  context: context,
                  isDismissible: false,
                  backgroundColor:
                      isDarkMode(context) ? ExpenseTrackerColors.dark : null,
                  builder: (context) {
                    return SizedBox(
                      height: 200.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Remove this transaction?',
                            style: ExpenseTrackerTextStyle.title3.copyWith(
                              color: isDarkMode(context)
                                  ? ExpenseTrackerColors.light
                                  : ExpenseTrackerColors.dark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Are you sure do you wanna remove this transaction?',
                            style: ExpenseTrackerTextStyle.body2.copyWith(
                              color: ExpenseTrackerColors.light20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('No'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                      // show alert dialog for 2 seconds then pop
                                      await showDialog<void>(
                                        context: context,
                                        builder: (context) {
                                          Future.delayed(
                                            2.seconds,
                                            () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                          );
                                          return const SuccessfullyDeleted();
                                        },
                                      );
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                CupertinoIcons.delete_solid,
                color: ExpenseTrackerColors.light,
              ),
            ),
          ),
        ),

        //INFO: title
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'Detail Transaction',
              textAlign: TextAlign.center,
              style: ExpenseTrackerTextStyle.title3.copyWith(
                color: ExpenseTrackerColors.light,
              ),
            ),
          ),
        ),
        //INFO: main content (amount, description and date)
        Align(
          child: AnimatedOpacity(
            duration: 600.milliseconds,
            opacity: 1 - shrinkOffset / expandedHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${getAmount()}',
                  // textAlign: TextAlign.center,
                  style: ExpenseTrackerTextStyle.title1.copyWith(
                    color: ExpenseTrackerColors.light80,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (1 - shrinkOffset / expandedHeight > 0.5) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                    ),
                    child: Text(
                      getCat()?.title ?? '',
                      style: ExpenseTrackerTextStyle.body3.copyWith(
                        color: ExpenseTrackerColors.light80,
                      ),
                    ),
                  ),
                  Text(
                    getDateTime(),
                    style: ExpenseTrackerTextStyle.body3.copyWith(
                      color: ExpenseTrackerColors.light80,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        //INFO: details (card)
        AnimatedPositioned(
          top: expandedHeight / 1.3 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 7 - 50.r,
          right: MediaQuery.of(context).size.width / 7 - 50.r,
          // center the avatar
          duration: 600.milliseconds,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AnimatedOpacity(
              duration: 600.milliseconds,
              opacity: 1 - shrinkOffset / expandedHeight,
              child: Card(
                margin: const EdgeInsets.all(
                  0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SizedBox(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DetailCenterCard(
                        subtitle: getDetailCardSubtitle(),
                        title: 'Type',
                      ),
                      DetailCenterCard(
                        subtitle: 'Shopping',
                        title: 'Category',
                      ),
                      DetailCenterCard(
                        subtitle: 'Cash',
                        title: 'Payment',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
