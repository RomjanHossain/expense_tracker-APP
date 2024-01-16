import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/core/routes/routes_of_the_app.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_expense_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/dropdown_data/dropdown_income_method_cubit.dart';
import 'package:expense_tracker/presentation/cubit/expense_text_controller_cubit.dart';
import 'package:expense_tracker/presentation/pages/app_home_page/app_home_page.dart';
import 'package:expense_tracker/presentation/pages/expenseform/bloc/expenseform_bloc.dart';
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ExpenseTrackerTheme.standard,
        darkTheme: ExpenseTrackerTheme.darkTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: routeOfTheApp,
        // home: const SplashScreenPage(),(new)
      ),
    );
  }
}
