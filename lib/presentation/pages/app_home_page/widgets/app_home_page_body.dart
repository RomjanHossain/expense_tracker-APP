import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';

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
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
