import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:flutter/foundation.dart';
part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc() : super(const BudgetInitial()) {
    on<CustomBudgetEvent>(_onCustomBudgetEvent);
    on<ChangeNextMonthBudgetEvent>(_changeNextMon);
    on<ChangePrevMonthBudgetEvent>(_changePrevMon);
  }

  FutureOr<void> _onCustomBudgetEvent(
    CustomBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    final db = DriftRepository();
    final currentMonth = DateTime.now().month;
    final data = await db.getBudgets(currentMonth);
    debugPrint('budget len ${data.length} || $data');
    emit(state.copyWith(budgetList: data, currentMon: currentMonth - 1));
  }

  /// change next month
  FutureOr<void> _changeNextMon(
    ChangeNextMonthBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    if (state.currentMon < 11) {
      final db = DriftRepository();
      final data = await db.getBudgets(state.currentMon + 2);
      emit(state.copyWith(currentMon: state.currentMon + 1, budgetList: data));
    }
  }

  /// change prev month
  FutureOr<void> _changePrevMon(
    ChangePrevMonthBudgetEvent event,
    Emitter<BudgetState> emit,
  ) async {
    if (state.currentMon > 0) {
      final db = DriftRepository();
      final data = await db.getBudgets(state.currentMon);
      emit(state.copyWith(currentMon: state.currentMon - 1, budgetList: data));
    }
  }
}
