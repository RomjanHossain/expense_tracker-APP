import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/components/custom_app_bar.dart';
import 'package:expense_tracker/presentation/pages/expensedetails/cubit/cubit.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
import 'package:expense_tracker/utils/constrants/expense_category_tracker_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A description for ExpensedetailsPage
class ExpensedetailsPage extends StatelessWidget {
  /// {@macro expensedetails_page}
  const ExpensedetailsPage({required this.ieModel, super.key});

  final IEmodel ieModel;

  // get description
  String getDescription() {
    switch (ieModel.isIncome) {
      case ExpenseType.income:
        return ieModel.income?.description ?? 'No Description';
      case ExpenseType.expense:
        return ieModel.expense?.description ?? 'No Description';
      case ExpenseType.transfer:
        return ieModel.transfer?.description ?? 'No Description';
    }
  }

  /// The static route for ExpensedetailsPage
  static Route<dynamic> route(IEmodel et) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ExpensedetailsPage(
        ieModel: et,
      ),
    );
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
                ieModel: ieModel,
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
                          getDescription(),
                          style: ExpenseTrackerTextStyle.body1.copyWith(
                            color: isDarkMode(context)
                                ? ExpenseTrackerColors.light
                                : ExpenseTrackerColors.dark,
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
                            color: isDarkMode(context)
                                ? ExpenseTrackerColors.dark25
                                : ExpenseTrackerColors.light40,
                            borderRadius: BorderRadius.circular(10.r),
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
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Edit'),
                    ),
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
