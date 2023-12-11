import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/bottom_navigationbar.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/bottom_transaction_sheet.dart';
// import 'package:expense_tracker/presentation/pages/app_home_page/components/add_transaction_sheet.dart';
// import 'package:expense_tracker/presentation/pages/app_home_page/components/app_bottom_navigationbar.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/widgets/app_home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// {@template app_home_page_page}
/// 67149812
/// A description for AppHomePagePage
/// {@endtemplate}
class AppHomePagePage extends StatelessWidget {
  /// {@macro app_home_page_page}
  const AppHomePagePage({super.key});

  /// The static route for AppHomePagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AppHomePagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppHomePageBloc(),
      child: const AppHomePageScaffold(),
    );
  }
}

class AppHomePageScaffold extends StatelessWidget {
  const AppHomePageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AppHomePageView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ExpenseTrackerColors.primary,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showBarModalBottomSheet(
            context: context,
            expand: true,
            builder: (c) => AddTransactionBottomSheet(),
          );
        },
        //params
      ),
      bottomNavigationBar: const ExpanseTrackerBottomNavBar(),
    );
  }
}

/// {@template app_home_page_view}
/// Displays the Body of AppHomePageView
/// {@endtemplate}
class AppHomePageView extends StatelessWidget {
  /// {@macro app_home_page_view}
  const AppHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppHomePageBody();
  }
}
