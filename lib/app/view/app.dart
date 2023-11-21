import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_category_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ExpenseTextControllerCubit
        BlocProvider<ExpenseTextControllerCubit>(
          create: (context) => ExpenseTextControllerCubit(),
        ),

        /// dropdown values [expense methods]
        BlocProvider(
          create: (context) => DropdownExpenseMethodCubit(),
        ),

        /// dropdown values [expended Category methods]
        BlocProvider(
          create: (context) => DropdownCategoryMethodCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ExpenseTrackerTheme.standard,
        darkTheme: ExpenseTrackerTheme.darkTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // home: const SplashScreenPage(),
        home: const AppHomePagePage(),
      ),
    );
  }
}
