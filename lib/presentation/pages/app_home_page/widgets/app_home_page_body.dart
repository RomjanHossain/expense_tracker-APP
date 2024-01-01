import 'package:animations/animations.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/borrow_or_lend_page/borrow_or_lend_page.dart';
import 'package:expense_tracker/presentation/pages/homepage/homepage.dart';
import 'package:expense_tracker/presentation/pages/profile_page/profile_page.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/transaction_graph_page.dart';
import 'package:flutter/material.dart';

/// {@template app_home_page_body}
/// Body of the AppHomePagePage.
///
/// Add what it does
/// {@endtemplate}
class AppHomePageBody extends StatelessWidget {
  /// {@macro app_home_page_body}
  const AppHomePageBody({super.key});
  static const pages = [
    HomepagePage(),
    TransactionGraphPagePage(),
    BorrowOrLendPagePage(),
    ProfilePagePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppHomePageBloc, AppHomePageState>(
      builder: (context, state) {
        return PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: pages[state.currentIndex],
        );
      },
    );
  }
}
