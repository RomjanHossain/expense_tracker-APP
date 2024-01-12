import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IESmallCard extends StatelessWidget {
  const IESmallCard({
    required this.money,
    required this.svgAsset,
    required this.title,
    required this.color,
    super.key,
  });
  final String title;
  final String money;
  final String svgAsset;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20).w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 10.w,
            ),
            padding: const EdgeInsets.all(5).r,
            decoration: BoxDecoration(
              color: ExpenseTrackerColors.light,
              borderRadius: BorderRadius.circular(15).w,
            ),
            child: SvgPicture.asset(
              svgAsset,
              color: color,
            ),
          ),
          Column(
            children: [
              Text(
                title,
                style: ExpenseTrackerTextStyle.body3.copyWith(
                  color: ExpenseTrackerColors.light80,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$$money',
                style: ExpenseTrackerTextStyle.title3.copyWith(
                  color: ExpenseTrackerColors.light80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
