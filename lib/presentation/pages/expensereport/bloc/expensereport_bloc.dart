import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:flutter/rendering.dart';

part 'expensereport_event.dart';
part 'expensereport_state.dart';

class ExpensereportBloc extends Bloc<ExpensereportEvent, ExpensereportState> {
  ExpensereportBloc() : super(const ExpensereportInitial()) {
    on<CustomExpensereportEvent>(_onCustomExpensereportEvent);
    on<ChangeExpenseType>(_changeETypeEvent);
    on<ChangeChartType>(_changeCTypeEvent);
    on<ChangeFrequency>(_changeFrequencyEvent);
  }

  FutureOr<void> _onCustomExpensereportEvent(
    CustomExpensereportEvent event,
    Emitter<ExpensereportState> emit,
  ) async {
    // in the init state get all the data from data base
    final db = DriftRepository();

    final yearlyIncome = await db.getYearsIncome();
    final yearlyTransfer = await db.getYearsTransfer();
    final yearlyExpense = await db.getYearsExpense();
    // todays model
    final yearly = <IEmodel>[
      ...yearlyIncome.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.income,
          income: e,
          expense: null,
          transfer: null,
        ),
      ),
      ...yearlyExpense.map(
        (e) => IEmodel(
          createdAt: e.createdDate!,
          isIncome: ExpenseType.expense,
          income: null,
          expense: e,
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
    // todays model
    final today = DateTime.now();
    final todays = yearly.where(
      (e) =>
          e.createdAt.month == today.month &&
          e.createdAt.year == today.year &&
          e.createdAt.day == today.day,
    );
    final weekly = yearly.where(
      (e) =>
          e.createdAt.month == today.month &&
          e.createdAt.year == today.year &&
          e.createdAt.day >= today.day - 7,
    );
    final monthly = yearly.where(
      (e) => e.createdAt.month == today.month && e.createdAt.year == today.year,
    );
    debugPrint('yearly: ${yearly.length}');
    debugPrint('todays: ${todays.length}');
    debugPrint('weekly: ${weekly.length}');
    debugPrint('monthly: ${monthly.length}');

    emit(
      state.copyWith(
        yearlyData: yearly,
        dailyData: todays.toList(),
        weeklyData: weekly.toList(),
        monthlyData: monthly.toList(),
      ),
    );
  }

  // change frequency
  FutureOr<void> _changeFrequencyEvent(
    ChangeFrequency event,
    Emitter<ExpensereportState> emit,
  ) {
    if (state.frequency != event.frequency) {
      emit(state.copyWith(frequency: event.frequency));
    }
  }

  /// change e type

  FutureOr<void> _changeETypeEvent(
    ChangeExpenseType event,
    Emitter<ExpensereportState> emit,
  ) {
    if (state.etype != event.etype) {
      emit(state.copyWith(etype: event.etype));
    }
  }

  /// chagne c type
  FutureOr<void> _changeCTypeEvent(
    ChangeChartType event,
    Emitter<ExpensereportState> emit,
  ) {
    if (state.chartType != event.chartType) {
      emit(state.copyWith(chartType: event.chartType));
    }
  }
}
