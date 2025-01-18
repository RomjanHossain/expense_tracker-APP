import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_account_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/bottom_navigationbar.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/widgets/app_home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pie_menu/pie_menu.dart';

class AppHomePagePage extends StatelessWidget {
  const AppHomePagePage({super.key});

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
    return PieCanvas(
      child: Scaffold(
        body: const AppHomePageView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: PieMenu(
          theme: PieTheme(
            overlayColor: ExpenseTrackerColors.violet20.withValues(alpha: 0.8),
            pointerColor: ExpenseTrackerColors.blue,
            pointerSize: 0.01,
            delayDuration: Duration.zero,
          ),
          actions: [
            PieAction(
              tooltip: const Text(
                '',
              ),
              onSelect: () {
                //! NOTE: running this for checking if theres a new wallet
                context.read<DropdownAccountCubit>().runOnFirst();
                context.pushNamed(
                  'income',
                  extra: ExpenseType.income,
                );
              },
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: ExpenseTrackerColors.green,
                shape: const CircleBorder(),
                child: SvgPicture.asset(
                  ExpenseAssets.incomeIcon,
                  color: ExpenseTrackerColors.light,
                ),
              ),
            ),
            PieAction(
              tooltip: const Text(''),
              onSelect: () {
                //! NOTE: running this for checking if theres a new wallet
                context.read<DropdownAccountCubit>().runOnFirst();
                context.pushNamed(
                  'transfer',
                  extra: ExpenseType.transfer,
                );
              },
              child: FloatingActionButton(
                onPressed: null,
                backgroundColor: ExpenseTrackerColors.blue,
                shape: const CircleBorder(),
                // backgroundColor: ExpenseTrackerColors.primary,
                child: SvgPicture.asset(
                  ExpenseAssets.transactionIcon,
                  color: ExpenseTrackerColors.light,
                ),
              ),
            ),
            PieAction(
              tooltip: const Text(''),
              onSelect: () {
                //! NOTE: running this for checking if theres a new wallet
                context.read<DropdownAccountCubit>().runOnFirst();
                context.pushNamed(
                  'expense',
                  extra: ExpenseType.expense,
                );
              },
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: ExpenseTrackerColors.red,
                shape: const CircleBorder(),
                // backgroundColor: ExpenseTrackerColors.primary,
                child: SvgPicture.asset(
                  ExpenseAssets.expenseIcon,
                  color: ExpenseTrackerColors.light,
                ),
              ),
            ),
          ],
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: ExpenseTrackerColors.violet,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
        bottomNavigationBar: const ExpanseTrackerBottomNavBar(),
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
