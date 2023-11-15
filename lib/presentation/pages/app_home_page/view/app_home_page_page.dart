import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/widgets/app_home_page_body.dart';
import 'package:flutter/material.dart';

/// {@template app_home_page_page}
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
      child: const Scaffold(
        body: AppHomePageView(),
      ),
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
