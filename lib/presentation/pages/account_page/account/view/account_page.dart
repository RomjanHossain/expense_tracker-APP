import 'package:animations/animations.dart';
import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/account_page/account/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/account_page/account/widgets/account_body.dart';
import 'package:expense_tracker/presentation/pages/onboarding/page/onboarding_account_setup/view/onboarding_account_setup_page.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// {@template account_page}
/// A description for AccountPage
/// {@endtemplate}
class AccountPage extends StatelessWidget {
  /// {@macro account_page}
  const AccountPage({super.key});

  /// The static route for AccountPage
  static Route<dynamic> route() =>
      CupertinoPageRoute<dynamic>(builder: (_) => const AccountPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit()..runAtFirst(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode(context)
              ? ExpenseTrackerColors.dark
              : ExpenseTrackerColors.light,
          title: const Text('Account'),
        ),
        body: const AccountView(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: OpenContainer(
            openColor: isDarkMode(context)
                ? ExpenseTrackerColors.dark
                : ExpenseTrackerColors.light,
            closedColor: isDarkMode(context)
                ? ExpenseTrackerColors.dark
                : ExpenseTrackerColors.light,
            closedBuilder: (context, action) {
              return ElevatedButton(
                onPressed: action,
                child: const Text('Add Account'),
              );
            },
            openBuilder: (context, action) {
              return const OnboardingAccountSetupPage();
            },
          ),
        ),
      ),
    );
  }
}

/// {@template account_view}
/// Displays the Body of AccountView
/// {@endtemplate}
class AccountView extends StatelessWidget {
  /// {@macro account_view}
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountBody();
  }
}
