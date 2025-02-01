import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/data/models/local_db_model/both_iemodel.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:flutter/material.dart';

part 'transaction_graph_page_event.dart';
part 'transaction_graph_page_state.dart';

class TransactionGraphPageBloc
    extends Bloc<TransactionGraphPageEvent, TransactionGraphPageState> {
  TransactionGraphPageBloc() : super(const TransactionGraphPageInitial()) {
    on<CustomTransactionGraphPageEvent>(_onCustomTransactionGraphPageEvent);
    on<ChangeExpenseTypeEvent>(_changeExpenseTypeE);
    on<ChangeSortTypeEvent>(_changeSortTypeE);
    on<ChangeCategoryEvent>(_changeSelectedE);
    on<InitTransactionGraphPageEvent>(_initTransactionGraphPageE);
  }

  // final isar = IsarInstance();
  //! INFO: init transaction
  FutureOr<void> _initTransactionGraphPageE(
    InitTransactionGraphPageEvent event,
    Emitter<TransactionGraphPageState> emit,
  ) async {
    final db = DriftRepository();
    // final todaysIncome = await isar.getTodaysIncome();
    // final todaysTransfer = await isar.getTodaysTransfer();
    // final todaysExpense = await isar.getTodaysExpense();

    // final todaysIncome = await db.getTodaysIncome();
    // final todaysTransfer = await db.getTodaysTransfer();
    // final todaysExpense = await db.getTodaysExpense();

    // final yesterdaysIncome = await db.getYestIncome();
    // final yesterdaysExpense = await db.getYestExpense();
    // final yesterdaysTransfer = await db.getYestTransfer();

    // final weeklyIncome = await db.getWeeksIncome();
    // final weeklyTransfer = await db.getWeeksTransfer();
    // final weeklyExpense = await db.getWeeksExpense();

    // final monthlyIncome = await db.getMonthsIncome();
    // final monthlyTransfer = await db.getMonthsTransfer();
    // final monthlyExpense = await db.getMonthsExpense();

    final yearlyIncome = await db.getYearsIncome();
    final yearlyTransfer = await db.getYearsTransfer();
    final yearlyExpense = await db.getYearsExpense();

    // final todaysIEmodel = <IEmodel>[
    //   ...todaysIncome.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.income,
    //       income: e,
    //       expense: null,
    //       transfer: null,
    //     ),
    //   ),
    //   ...todaysExpense.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.expense,
    //       income: null,
    //       expense: e,
    //       transfer: null,
    //     ),
    //   ),
    //   ...todaysTransfer.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.transfer,
    //       income: null,
    //       expense: null,
    //       transfer: e,
    //     ),
    //   ),
    // ];

    // final yesterdayIEmodel = <IEmodel>[
    //   ...yesterdaysIncome.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.income,
    //       income: e,
    //       expense: null,
    //       transfer: null,
    //     ),
    //   ),
    //   ...yesterdaysExpense.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.expense,
    //       income: null,
    //       expense: e,
    //       transfer: null,
    //     ),
    //   ),
    //   ...yesterdaysTransfer.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.transfer,
    //       income: null,
    //       expense: null,
    //       transfer: e,
    //     ),
    //   ),
    // ];

    // final weeksIEmodel = <IEmodel>[
    //   ...weeklyIncome.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.income,
    //       income: e,
    //       expense: null,
    //       transfer: null,
    //     ),
    //   ),
    //   ...weeklyExpense.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.expense,
    //       income: null,
    //       expense: e,
    //       transfer: null,
    //     ),
    //   ),
    //   ...weeklyTransfer.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.transfer,
    //       income: null,
    //       expense: null,
    //       transfer: e,
    //     ),
    //   ),
    // ];

    // final monthlyIEmodel = <IEmodel>[
    //   ...monthlyIncome.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.income,
    //       income: e,
    //       expense: null,
    //       transfer: null,
    //     ),
    //   ),
    //   ...monthlyExpense.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.expense,
    //       income: null,
    //       expense: e,
    //       transfer: null,
    //     ),
    //   ),
    //   ...monthlyTransfer.map(
    //     (e) => IEmodel(
    //       createdAt: e.createdDate!,
    //       isIncome: ExpenseType.transfer,
    //       income: null,
    //       expense: null,
    //       transfer: e,
    //     ),
    //   ),
    // ];

    final yearlyIEModel = <IEmodel>[
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

    emit(
      state.copyWith(
        // todaysIEmodel: todaysIEmodel,
        // yesterdaysIEmodel: yesterdayIEmodel,
        // weeklyIEmodel: weeksIEmodel,
        // monthlyIEmodel: monthlyIEmodel,
        yearlyIEmodel: yearlyIEModel,
      ),
    );
  }

  FutureOr<void> _onCustomTransactionGraphPageEvent(
    CustomTransactionGraphPageEvent event,
    Emitter<TransactionGraphPageState> emit,
  ) {}

  //NOTE: expense type change
  FutureOr<void> _changeExpenseTypeE(
    ChangeExpenseTypeEvent event,
    Emitter<TransactionGraphPageState> emit,
  ) {
    if (state.expenseType != event.expenseType) {
      emit(state.copyWith(expenseType: event.expenseType));
    }
  }

  //NOTE: sort type change
  FutureOr<void> _changeSortTypeE(
    ChangeSortTypeEvent event,
    Emitter<TransactionGraphPageState> emit,
  ) {
    if (state.sortType != event.sortType) {
      emit(state.copyWith(sortType: event.sortType));
    }
  }

  //NOTE: add/remove category selected
  FutureOr<void> _changeSelectedE(
    ChangeCategoryEvent event,
    Emitter<TransactionGraphPageState> emit,
  ) {
    debugPrint(
      'categorySelected event called: ${state.categorySelected.length}',
    );
    if (state.categorySelected.isNotEmpty) {
      //!NOTE: check if the values exists in the categorySelected or not
      if (!state.categorySelected.contains(event.category)) {
        state.categorySelected.add(event.category);
        debugPrint('emit called: ');
        emit(
          state.copyWith(
            categorySelected: state.categorySelected,
          ),
        );
      } else {
        state.categorySelected.remove(event.category);
        debugPrint('emit called: ');
        emit(
          state.copyWith(
            categorySelected: state.categorySelected,
          ),
        );
      }
    } else {
      debugPrint('emit called: ');
      //!NOTE: if the default (const List<catmodel>) is empty then replace it with a new modifiable list<catmodel>
      emit(state.copyWith(categorySelected: [event.category]));
    }
  }
}
