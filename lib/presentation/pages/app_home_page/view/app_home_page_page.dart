import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/components/bottom_navigationbar.dart';
// import 'package:expense_tracker/presentation/pages/app_home_page/components/add_transaction_sheet.dart';
// import 'package:expense_tracker/presentation/pages/app_home_page/components/app_bottom_navigationbar.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/widgets/app_home_page_body.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/theme_cubit.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pie_menu/pie_menu.dart';
// import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

/// {@template app_home_page_page}
/// 67149812
/// A description for AppHomePagePage
/// {@endtemplate}
class AppHomePagePage extends StatelessWidget {
  /// {@macro app_home_page_page}
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
      theme: const PieTheme(
        overlayColor: ExpenseTrackerColors.violet20,
        pointerColor: ExpenseTrackerColors.blue,
        pointerSize: 0.01,
      ),
      child: Scaffold(
        body: const AppHomePageView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: PieMenu(

          actions: [
            PieAction(
              tooltip: const Text(
                '',
              ),
              onSelect: () {
                context.pushNamed(
                  'income',
                  extra: ExpenseType.income,
                );
              },
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: ExpenseTrackerColors.green,
                shape: const CircleBorder(),
                // backgroundColor: ExpenseTrackerColors.primary,
                child: SvgPicture.asset(
                  ExpenseAssets.incomeIcon,
                  color: ExpenseTrackerColors.light,
                ),
              ),
            ),
            PieAction(
              tooltip: const Text(''),
              onSelect: () {
                // Navigator.push(
                //     context, ExpenseformPage.route(ExpenseType.transfer));
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
                // Navigator.push(
                //     context, ExpenseformPage.route(ExpenseType.expense));
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
          child: ThemeSwitcher.switcher(
            builder: (context, switcher) {
              return FloatingActionButton(
                onPressed: () {
                  final themeState = context.read<ThemeCubit>().state;
                  debugPrint('Theme state -> $themeState');
                  switcher.changeTheme(
                    theme: themeState is ThemeLight
                        ? ExpenseTrackerTheme.darkTheme.copyWith(
                            brightness: Brightness.dark,
                          )
                        : ExpenseTrackerTheme.standard.copyWith(
                            brightness: Brightness.light,
                          ),
                  );
                  // change the state
                  context.read<ThemeCubit>().toggleTheme();
                },
                backgroundColor: ExpenseTrackerColors.violet,
                shape: const CircleBorder(),
                // backgroundColor: ExpenseTrackerColors.primary,
                child: const Icon(
                  Icons.add,
                ),
              );
            },
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
