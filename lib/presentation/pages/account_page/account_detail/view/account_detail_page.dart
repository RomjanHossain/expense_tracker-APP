import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/account_page/account_detail/widgets/account_detail_body.dart';

/// {@template account_detail_page}
/// A description for AccountDetailPage
/// {@endtemplate}
class AccountDetailPage extends StatelessWidget {
  /// {@macro account_detail_page}
  const AccountDetailPage({super.key});

  /// The static route for AccountDetailPage
  static Route<dynamic> route() {
    return CupertinoPageRoute<dynamic>(
        builder: (_) => const AccountDetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountDetailCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode(context)
              ? ExpenseTrackerColors.dark
              : ExpenseTrackerColors.light,
          title: const Text('Detail Account'),
          actions: [
            // edit icon btn
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                // color: Colors.white,
              ),
            ),
          ],
        ),
        body: const AccountDetailView(),
      ),
    );
  }
}

/// {@template account_detail_view}
/// Displays the Body of AccountDetailView
/// {@endtemplate}
class AccountDetailView extends StatelessWidget {
  /// {@macro account_detail_view}
  const AccountDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountDetailBody();
  }
}
