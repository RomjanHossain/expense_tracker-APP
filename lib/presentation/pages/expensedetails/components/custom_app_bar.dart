import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/components/detail_center_card.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({required this.expandedHeight, required this.et});
  final double expandedHeight;
  final ExpenseType et;
  Color getColor() {
    switch (et) {
      case ExpenseType.expense:
        return ExpenseTrackerColors.red;
      case ExpenseType.income:
        return ExpenseTrackerColors.green;
      case ExpenseType.transfer:
        return ExpenseTrackerColors.blue;
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
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
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.delete_solid,
                color: ExpenseTrackerColors.light,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              'My Profile',
              textAlign: TextAlign.center,
              style: ExpenseTrackerTextStyle.title3.copyWith(
                color: ExpenseTrackerColors.light,
              ),
            ),
          ),
        ),
        Align(
          child: AnimatedOpacity(
            duration: 600.milliseconds,
            opacity: 1 - shrinkOffset / expandedHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  r'$234',
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
                      'Buy some groceries',
                      style: ExpenseTrackerTextStyle.body3.copyWith(
                        color: ExpenseTrackerColors.light80,
                        
                      ),
                    ),
                  ),
                  Text(
                    'Saturday, 20th March 2021, 10:00 AM',
                    style: ExpenseTrackerTextStyle.body3.copyWith(
                      color: ExpenseTrackerColors.light80,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          top: expandedHeight / 1.3 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 7 - 50.r,
          right: MediaQuery.of(context).size.width / 7 - 50.r,
          // center the avatar
          duration: 600.milliseconds,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              duration: 600.milliseconds,
              opacity: 1 - shrinkOffset / expandedHeight,
              child: Card(
                margin: const EdgeInsets.all(0
                    // right: 80.w,
                    // vertical: 10.h,
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SizedBox(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DetailCenterCard(
                        subtitle: 'Income',
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