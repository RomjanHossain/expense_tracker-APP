import 'package:animations/animations.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/budget/view/budget_page.dart';
import 'package:expense_tracker/presentation/pages/homepage/homepage.dart';
import 'package:expense_tracker/presentation/pages/profile_page/profile_page.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/transaction_graph_page.dart';
import 'package:flutter/material.dart';

class AppHomePageBody extends StatelessWidget {
  const AppHomePageBody({super.key});

  static final pages = [
    const HomepagePage(),
    const TransactionGraphPagePage(),
    const BudgetPage(),
    const ProfilePagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppHomePageBloc, AppHomePageState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex, // Key improvement
      builder: (context, state) {
        final validIndex =
            (state.currentIndex < pages.length) ? state.currentIndex : 0;
        return _PageContent(
            index: validIndex,
            child: pages[validIndex]); // Extract to a separate widget
      },
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      // Keep KeyedSubtree here
      key: ValueKey('page_$index'), // Use index in the key
      child: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: child,
      ),
    );
  }
}
