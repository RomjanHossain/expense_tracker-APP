import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:expense_tracker/presentation/pages/createbudget/model/create_budget_entity.dart';
import 'package:flutter/foundation.dart';
part 'createbudget_state.dart';

class CreatebudgetCubit extends Cubit<CreatebudgetState> {
  CreatebudgetCubit() : super(const CreatebudgetInitial());

  /// change amount
  FutureOr<void> changeAmmount(double ammount) {
    emit(
      state.copyWith(
        ammount: ammount,
      ),
    );
  }

  /// change category
  FutureOr<void> changeCategory(String cat) {
    emit(
      state.copyWith(
        cat: cat,
      ),
    );
  }

  /// change isAlert
  FutureOr<void> activeAlert() {
    emit(
      state.copyWith(
        isAlert: true,
      ),
    );
  }

  FutureOr<void> deactiveAlert() {
    emit(
      state.copyWith(
        isAlert: false,
      ),
    );
  }

  /// change percent
  FutureOr<void> changePercent(double percent) {
    emit(
      state.copyWith(
        percent: percent,
      ),
    );
  }

  // create a budget
  FutureOr<int> createBudget() async {
    debugPrint('amount :${state.budget.amount}');
    debugPrint('category :${state.budget.category}');
    debugPrint(
      'isReceiveAlert :${state.budget.isReceiveAlert}',
    );
    debugPrint('percent :${state.budget.percent}');
    final db = DriftRepository();

    final pd = BudgetsCompanion(
      amount: Value(state.budget.amount),
      isRepeat: Value(state.budget.isReceiveAlert),
      category: Value(state.budget.category),
      spent: const Value(0),
      createdDate: Value(DateTime.now()),
      percentage: Value(state.budget.percent),
    );
    try {
      final id = await db.setBudget(pd);
      return id;
    } catch (e) {
      debugPrint('error :$e');
      return -1;
    }
  }
}
