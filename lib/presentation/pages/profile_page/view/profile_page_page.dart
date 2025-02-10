import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/profile_page/widgets/profile_page_body.dart';
import 'package:flutter/material.dart';

/// {@template profile_page_page}
/// A description for ProfilePagePage
/// {@endtemplate}
class ProfilePagePage extends StatelessWidget {
  /// {@macro profile_page_page}
  const ProfilePagePage({super.key});

  /// The static route for ProfilePagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ProfilePagePage());
  }

  @override
  Widget build(BuildContext context) {
    Color backGroundColor() {
      return isDarkMode(context)
          ? const Color(0xff222222)
          : const Color(0xfff6f6f6);
    }

    return BlocProvider(
      create: (context) => ProfilePageBloc(),
      child: Scaffold(
        backgroundColor: backGroundColor(),
        body: const ProfilePageView(),
      ),
    );
  }
}

/// {@template profile_page_view}
/// Displays the Body of ProfilePageView
/// {@endtemplate}
class ProfilePageView extends StatelessWidget {
  /// {@macro profile_page_view}
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfilePageBody();
  }
}
