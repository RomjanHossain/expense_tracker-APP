import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/presentation/pages/budget/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/createbudget/view/createbudget_page.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template budget_body}
/// Body of the BudgetPage.
///
/// Add what it does
/// {@endtemplate}
class BudgetBody extends StatelessWidget {
  /// {@macro budget_body}
  const BudgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBloc, BudgetState>(
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
                  return const CreatebudgetPage();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
