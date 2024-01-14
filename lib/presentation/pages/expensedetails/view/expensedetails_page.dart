import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/components/custom_app_bar.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/widgets/expensedetails_body.dart';
import 'package:expense_tracker/presentation/widgets/buttons/buttons.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template expensedetails_page}
/// A description for ExpensedetailsPage
/// {@endtemplate}
class ExpensedetailsPage extends StatelessWidget {
  /// {@macro expensedetails_page}
  const ExpensedetailsPage({super.key, required this.color});

  final Color color;

  /// The static route for ExpensedetailsPage
  static Route<dynamic> route(Color col) {
    return MaterialPageRoute<dynamic>(
        builder: (_) => ExpensedetailsPage(
              color: col,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensedetailsCubit(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(
                expandedHeight: 200.h,
                et: ExpenseType.expense,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 80.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: ExpenseTrackerTextStyle.body2.copyWith(
                            color: ExpenseTrackerColors.light20,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '''Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. ''',
                          style: ExpenseTrackerTextStyle.body1.copyWith(
                            color: ExpenseTrackerColors.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Attachments',
                          style: ExpenseTrackerTextStyle.body2.copyWith(
                            color: ExpenseTrackerColors.light20,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            height: 100.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ExpenseTrackerColors.light40,
                              borderRadius: BorderRadius.circular(10.r),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: PrimaryButton(onPress: () {}, text: 'Edit'),
                  ),
                  // const ExpensedetailsView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
