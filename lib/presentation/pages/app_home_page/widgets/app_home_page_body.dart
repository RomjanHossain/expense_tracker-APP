import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template app_home_page_body}
/// Body of the AppHomePagePage.
///
/// Add what it does
/// {@endtemplate}
class AppHomePageBody extends StatelessWidget {
  /// {@macro app_home_page_body}
  const AppHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppHomePageBloc, AppHomePageState>(
      builder: (context, state) {
        if (state.currentIndex == 1) {
          return const Center(child: Text('Transaction Graph page'));
        } else if (state.currentIndex == 2) {
          return const Center(child: Text('Lend page'));
        } else if (state.currentIndex == 3) {
          return const Center(child: Text('Settings page'));
        } else {
          return const Center(child: Text('Home Page'));
        }
      },
    );
  }
}
