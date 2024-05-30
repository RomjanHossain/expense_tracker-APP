import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:flutter/foundation.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageInitial()) {
    on<ChangeTheFreq>(_changetheFreq);
    on<ChangeTheMonth>(_changeTheMonth);
    on<InitCalander>(_onInitCalander);
  }
  final isar = IsarInstance();

  //NOTE: change the freq
  FutureOr<void> _changetheFreq(
    ChangeTheFreq event,
    Emitter<HomepageState> emit,
  ) {
    if (event.se != state.se) {
      emit(state.copyWith(se: event.se));
    }
  }

  //! change the month
  FutureOr<void> _changeTheMonth(
    ChangeTheMonth event,
    Emitter<HomepageState> emit,
  ) async {
    debugPrint('month changed to ${event.month}');
    if (event.month != state.currentMonth) {
      debugPrint('month changed to ${event.month}');
      final month = event.month + 1;
      final totalBalancemonth = await isar.getTotalBalanceMonthly(month);
      final totalExpense = await isar.getTotalExpense(month);
      final totalIncome = await isar.getTotalIncome(month);
      emit(
        state.copyWith(
          currentMonth: event.month,
          income: totalIncome,
          expense: totalExpense,
          accountBalance: totalBalancemonth,
        ),
      );
    }
  }

  //! NOTE: _onInitCalander
  FutureOr<void> _onInitCalander(
    InitCalander event,
    Emitter<HomepageState> emit,
  ) async {
    debugPrint('init calander');
    final currentMonth = DateTime.now().month;
    // final currentDay = DateTime.now().day;

    //!NOTE: top part
    final totalBalancemonth = await isar.getTotalBalanceMonthly(currentMonth);
    final totalExpense = await isar.getTotalExpense(currentMonth);
    final totalIncome = await isar.getTotalIncome(currentMonth);
    //! NOTE: segment btn part
    final todaysIncome = await isar.getTodaysIncome();
    final todaysTransfer = await isar.getTodaysTransfer();
    final todaysExpense = await isar.getTodaysExpense();
    final weeklyIncome = await isar.getWeeksIncome();
    final weeklyTransfer = await isar.getWeeksTransfer();
    final weeklyExpense = await isar.getWeeksExpense();
    final monthlyIncome = await isar.getMonthsIncome();
    final monthlyTransfer = await isar.getMonthsTransfer();
    final monthlyExpense = await isar.getMonthsExpense();
    final yearlyIncome = await isar.getYearsIncome();
    final yearlyTransfer = await isar.getYearsTransfer();
    final yearlyExpense = await isar.getYearsExpense();
    //! HACK: todaysIEmodel
    final todaysIEmodel = <IEmodel>[
      ...todaysExpense.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.expense,
          income: null,
          expense: e,
          transfer: null,
        ),
      ),
      ...todaysIncome.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.income,
          income: e,
          expense: null,
          transfer: null,
        ),
      ),
      ...todaysTransfer.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.transfer,
          income: null,
          expense: null,
          transfer: e,
        ),
      ),
    ];

    //! HACK: weeklyIEmodel
    final weeklyIEmodel = <IEmodel>[
      ...weeklyExpense.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.expense,
          income: null,
          expense: e,
          transfer: null,
        ),
      ),
      ...weeklyIncome.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.income,
          income: e,
          expense: null,
          transfer: null,
        ),
      ),
      ...weeklyTransfer.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.transfer,
          income: null,
          expense: null,
          transfer: e,
        ),
      ),
    ];

    //! HACK: monthlyIEmodel
    final monthlyIEmodel = <IEmodel>[
      ...monthlyExpense.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.expense,
          income: null,
          expense: e,
          transfer: null,
        ),
      ),
      ...monthlyIncome.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.income,
          income: e,
          expense: null,
          transfer: null,
        ),
      ),
      ...monthlyTransfer.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.transfer,
          income: null,
          expense: null,
          transfer: e,
        ),
      ),
    ];

    //! HACK: yearlyIEmodel
    final yearlyIEmodel = <IEmodel>[
      ...yearlyExpense.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.expense,
          income: null,
          expense: e,
          transfer: null,
        ),
      ),
      ...yearlyIncome.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.income,
          income: e,
          expense: null,
          transfer: null,
        ),
      ),
      ...yearlyTransfer.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.transfer,
          income: null,
          expense: null,
          transfer: e,
        ),
      ),
    ];

    emit(
      state.copyWith(
        currentMonth: currentMonth - 1,
        income: totalIncome,
        expense: totalExpense,
        accountBalance: totalBalancemonth,
        todaysIEmodel: todaysIEmodel,
        weeklyIEmodel: weeklyIEmodel,
        yearlyIEmodel: yearlyIEmodel,
        monthlyIEmodel: monthlyIEmodel,
      ),
    );
  }
}
