import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/app/ui/src/typography/text_styles.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/createbudget/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/createbudget/widgets/createbudget_body.dart';
import 'package:flutter/material.dart';

/// {@template createbudget_page}
/// A description for CreatebudgetPage
/// {@endtemplate}
class CreatebudgetPage extends StatelessWidget {
  /// {@macro createbudget_page}
  const CreatebudgetPage({super.key});

  /// The static route for CreatebudgetPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CreatebudgetPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatebudgetCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Budget',
            style: ExpenseTrackerTextStyle.body1.copyWith(
              // color: ExpenseTrackerColors.light,
              color: isDarkMode(context)
                  ? ExpenseTrackerColors.light
                  : ExpenseTrackerColors.dark,
            ),
          ),
          elevation: 0,
          backgroundColor: ExpenseTrackerColors.violet,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ExpenseTrackerColors.light,
            ),
          ),
        ),
        backgroundColor: ExpenseTrackerColors.violet,
        body: const CreatebudgetView(),
      ),
    );
  }
}

/// {@template createbudget_view}
/// Displays the Body of CreatebudgetView
/// {@endtemplate}
class CreatebudgetView extends StatelessWidget {
  /// {@macro createbudget_view}
  const CreatebudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreatebudgetBody();
  }
}
