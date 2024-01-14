import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/createbudget/createbudget.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template borrow_or_lend_page_body}
/// Body of the BorrowOrLendPagePage.
///
/// Add what it does
/// {@endtemplate}
class BorrowOrLendPageBody extends StatelessWidget {
  /// {@macro borrow_or_lend_page_body}
  const BorrowOrLendPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BorrowOrLendPageBloc, BorrowOrLendPageState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              // margin: EdgeInsets.only(top: 0.1.sh),
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
              ),
              height: 0.2.sh,
              color: ExpenseTrackerColors.violet,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ExpenseTrackerColors.light,
                    ),
                  ),
                  Text(
                    'Borrow or Lend',
                    style: ExpenseTrackerTextStyle.body1.copyWith(
                      color: ExpenseTrackerColors.light,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: ExpenseTrackerColors.light,
                    ),
                  ),
                ],
              ),
            ),
            // hmmmmmm
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: 20.h,
              ),
              child: const Text(
                'You don’t have a budget. Let’s make one so you in control.',
                textAlign: TextAlign.center,
              ),
            ), // create a budget btn
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                bottom: 35.h,
              ),
              // child: PrimaryButton(
              //   onPress: () {},
              //   text: 'Create a Budget',
              // ),
              child: OpenContainer(
                closedBuilder: (context, action) {
                  return PrimaryButton(
                    onPress: action,
                    text: 'Create a Budget',
                  );
                },
                openBuilder: (context, action) {
                  return CreatebudgetPage();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
