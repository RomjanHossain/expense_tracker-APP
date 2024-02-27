import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/routes/routes_of_the_app.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/expenseform_bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/cubit/currency_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/cubit/language_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/notification_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    ScreenUtil.init(context);
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
          create: (context) => DropdownIncomeMethodCubit(),
        ),
        //ExpenseformBloc
        BlocProvider(
          create: (context) => ExpenseformBloc(),
        ),
        //ThemeCubit
        BlocProvider(
          create: (context) => ThemeCubit()..getTheme(),
        ),
        // CurrencyCubit
        BlocProvider(
          create: (context) => CurrencyCubit()..getCurrentCurrency(),
        ),

        /// NotificationCubit
        BlocProvider(
          create: (context) => NotificationCubit()..getNotification(),
        ),
      ],
      child: ThemeProvider(
        builder: (context, theme) => BlocProvider(
          create: (context) => LanguageCubit()..getLanguage(),
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: theme,
                locale: switch (state) {
                  LanguageBangla() => const Locale('bn'),
                  LanguageEnglish() => const Locale('en'),
                  _ => const Locale('en'),
                },
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                // locale: Locale(AppLocalizations.of(context).localeName),
                routerConfig: routeOfTheApp,
              );
            },
          ),
        ),
        initTheme: _getThemeModeFromState(),
      ),
    );
  }
}

ThemeData _getThemeModeFromState() {
  final settingsLocalDataSourcePref = SettingsLocalDataSourcePref();
  final theme = settingsLocalDataSourcePref.getTheme();
  final isPlatformDark =
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  theme.then((value) {
    return switch (value) {
      'light' => ExpenseTrackerTheme.standard,
      'dark' => ExpenseTrackerTheme.darkTheme,
      _ => isPlatformDark
          ? ExpenseTrackerTheme.darkTheme
          : ExpenseTrackerTheme.standard,
    };
  }).catchError((e) {
    return isPlatformDark
        ? ExpenseTrackerTheme.darkTheme
        : ExpenseTrackerTheme.standard;
  });
  return isPlatformDark
      ? ExpenseTrackerTheme.darkTheme
      : ExpenseTrackerTheme.standard;
}
