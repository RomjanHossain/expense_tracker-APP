import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/utils/constrants/enums_.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:flutter/foundation.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageInitial()) {
    on<ChangeTheFreq>(_changetheFreq);
    on<ChangeTheMonth>(_changeTheMonth);
    on<InitCalander>(_onInitCalander);
  }

  final drift = DriftRepository();

  // NOTE: Change the frequency
  FutureOr<void> _changetheFreq(
    ChangeTheFreq event,
    Emitter<HomepageState> emit,
  ) {
    if (event.se != state.se) {
      emit(state.copyWith(se: event.se));
    }
  }

  // NOTE: Change the month
  FutureOr<void> _changeTheMonth(
    ChangeTheMonth event,
    Emitter<HomepageState> emit,
  ) async {
    debugPrint('month changed to ${event.month}');
    if (event.month != state.currentMonth) {
      debugPrint('month changed to ${event.month}');
      final month = event.month + 1;
      final totalExpense = await drift.getMonthlyExpense(month);
      final totalIncome = await drift.getMonthlyIncome(month);
      final totalTransfers = await drift.getMonthlyTransfer(month);
      final totalBalancemonth = (totalIncome + totalTransfers) - totalExpense;

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

  // NOTE: Initialize the calendar
  FutureOr<void> _onInitCalander(
    InitCalander event,
    Emitter<HomepageState> emit,
  ) async {
    debugPrint('Initializing calendar');
    final currentMonth = DateTime.now().month;

    //! Top part
    // final totalBalancemonth = await drift.getMonthlyBalance(currentMonth);
    final totalExpense = await drift.getMonthlyExpense(currentMonth);
    final totalIncome = await drift.getMonthlyIncome(currentMonth);
    final totalTransfers = await drift.getMonthlyTransfer(currentMonth);
    final totalBalancemonth = (totalIncome + totalTransfers) - totalExpense;

    //! Segment button part
    final todaysIncome = await drift.getTodaysIncome();
    final todaysTransfer = await drift.getTodaysTransfer();
    final todaysExpense = await drift.getTodaysExpense();
    final weeklyIncome = await drift.getWeeksIncome();
    final weeklyTransfer = await drift.getWeeksTransfer();
    final weeklyExpense = await drift.getWeeksExpense();
    final monthlyIncome = await drift.getMonthsIncome();
    final monthlyTransfer = await drift.getMonthsTransfer();
    final monthlyExpense = await drift.getMonthsExpense();
    final yearlyIncome = await drift.getYearsIncome();
    final yearlyTransfer = await drift.getYearsTransfer();
    final yearlyExpense = await drift.getYearsExpense();

    //! Today's IEmodel
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
    ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    //! Weekly IEmodel
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
    ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    //! Monthly IEmodel
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
    ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    //! Yearly IEmodel
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
    ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));

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
