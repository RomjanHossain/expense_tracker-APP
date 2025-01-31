import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/budget/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/createbudget/view/createbudget_page.dart';
import 'package:expense_tracker/presentation/pages/detailbudget/detail_budget.dart';
import 'package:expense_tracker/presentation/widgets/amount_progress_indicator.dart';
import 'package:expense_tracker/presentation/widgets/category_with_border.dart';
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

  Color getIndicateColor(double percentage) {
    // red if percentage is greater than 80
    if (percentage > 0.8) {
      return ExpenseTrackerColors.red;
    } else if (percentage > 0.6) {
      return ExpenseTrackerColors.yellow;
    } else if (percentage > 0.4) {
      return ExpenseTrackerColors.green;
    }
    return ExpenseTrackerColors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BudgetBloc, BudgetState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                // margin: EdgeInsets.only(top: 0.1.sh),
                decoration: BoxDecoration(
                  color: ExpenseTrackerColors.violet,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                height: 0.2.sh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context
                            .read<BudgetBloc>()
                            .add(const ChangePrevMonthBudgetEvent());
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                        color: ExpenseTrackerColors.light,
                      ),
                    ),
                    Text(
                      calanderMonths[state.currentMon],
                      style: ExpenseTrackerTextStyle.body1.copyWith(
                        color: ExpenseTrackerColors.light,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<BudgetBloc>()
                            .add(const ChangeNextMonthBudgetEvent());
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: ExpenseTrackerColors.light,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (state.budgetList.isEmpty)
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 20.h,
                  ),
                  child: const Center(
                    child: Text(
                      'You don’t have a budget. Let’s make one so you in control.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                flex: 7,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.budgetList.length,
                  itemBuilder: (context, index) {
                    final budget = state.budgetList[index];

                    return OpenContainer(
                      closedColor: isDarkMode(context)
                          ? ExpenseTrackerColors.dark75
                          : ExpenseTrackerColors.light80,
                      closedBuilder: (context, action) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CategoryWithBorder(
                                    color: generatingRandomColor()
                                        .withValues(alpha: 0.8),
                                    title: budget.category,
                                  ),
                                  if (budget.remaining < 1 ||
                                      (budget.percentage ?? 0) >
                                          (budget.remaining / budget.amount))
                                    const IconButton(
                                      // radius: 10.r,
                                      // color: Colors.red,
                                      disabledColor: Colors.red,
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.error_sharp,
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Remaing: \$${budget.remaining}',
                                style: ExpenseTrackerTextStyle.title3.copyWith(
                                  color: isDarkMode(context)
                                      ? ExpenseTrackerColors.light
                                      : ExpenseTrackerColors.dark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.h,
                                ),
                                child: AmountProgressIndicator(
                                  color: getIndicateColor(
                                      budget.spent / budget.amount),
                                  value: budget.spent / budget.amount,
                                ),
                              ),
                              Text(
                                '\$${budget.spent} of \$${budget.amount}',
                                style: ExpenseTrackerTextStyle.body3.copyWith(
                                  color: ExpenseTrackerColors.light20,
                                ),
                              ),
                              if (budget.remaining < 1)
                                Text(
                                  'You’ve exceed the limit!',
                                  style: ExpenseTrackerTextStyle.tiny.copyWith(
                                    color: ExpenseTrackerColors.red,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      openBuilder: (context, action) {
                        return DetailBudget(
                          budget: budget,
                        );
                      },
                    );
                  },
                ),
              ),

            /// create a budget btn
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  bottom: 35.h,
                ),
                child: OpenContainer(
                  closedColor: isDarkMode(context)
                      ? ExpenseTrackerColors.dark75
                      : ExpenseTrackerColors.light80,
                  closedBuilder: (context, action) {
                    return ElevatedButton(
                      onPressed: action,
                      child: const Text('Create a Budget'),
                    );
                  },
                  openBuilder: (context, action) {
                    return const CreatebudgetPage();
                  },
                ),
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, BudgetState state) {},
    );
  }
}
