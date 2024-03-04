import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
part 'transaction_graph_page_event.dart';
part 'transaction_graph_page_state.dart';

class TransactionGraphPageBloc
    extends Bloc<TransactionGraphPageEvent, TransactionGraphPageState> {
  TransactionGraphPageBloc() : super(const TransactionGraphPageInitial()) {
    on<CustomTransactionGraphPageEvent>(_onCustomTransactionGraphPageEvent);
    on<ChangeExpenseTypeEvent>(_changeExpenseTypeE);
    on<ChangeSortTypeEvent>(_changeSortTypeE);
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
}
