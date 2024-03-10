import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/category_model.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
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
        'categorySelected event called: ${state.categorySelected.length}',);
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
