import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/routes/routes_of_the_app.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/blocs/user_profile_bloc.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_account_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/expenseform_bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/currency/cubit/currency_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/notification/cubit/notification_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/cubit/theme_cubit.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/transaction_graph_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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

        /// dropdown values [Accounts]
        BlocProvider(
          create: (context) => DropdownAccountCubit()..runOnFirst(),
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

        //! transaction graph
        BlocProvider(create: (c) => TransactionGraphPageBloc()),
        //! NOTE: user profiel bloc
        BlocProvider(create: (c) => UserProfileBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ExpenseTrackerTheme.standard,
        // locale: switch (state) {
        //   LanguageBangla() => const Locale('bn'),
        //   LanguageEnglish() => const Locale('en'),
        //   _ => const Locale('en'),
        // },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // locale: Locale(AppLocalizations.of(context).localeName),
        routerConfig: routeOfTheApp,
      ),
    );
  }
}
