import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'expenseform_event.dart';
part 'expenseform_state.dart';

class ExpenseformBloc extends Bloc<ExpenseformEvent, ExpenseformState> {
  ExpenseformBloc() : super(const ExpenseformInitial()) {
    on<CustomExpenseformEvent>(_onCustomExpenseformEvent);
    // on<ChangeExpenseId>(_onChangeExpenseId);
    // on<ChangeIncomeSourceId>(_onChangeIncomeSourceId);
    on<ChangeRepeat>(_onChangeRepeat);
  }

  FutureOr<void> _onCustomExpenseformEvent(
    CustomExpenseformEvent event,
    Emitter<ExpenseformState> emit,
  ) {
    // TODO: Add Logic
  }
  // // change expense id
  // FutureOr<void> _onChangeExpenseId(
  //   ChangeExpenseId event,
  //   Emitter<ExpenseformState> emit,
  // ) {
  //   emit(state.copyWith(expenseId: event.expenseId));
  // }

  // // change income source id
  // FutureOr<void> _onChangeIncomeSourceId(
  //   ChangeIncomeSourceId event,
  //   Emitter<ExpenseformState> emit,
  // ) {
  //   emit(state.copyWith(incomeSourceId: event.incomeSourceId));
  // }

  // change repeat
  FutureOr<void> _onChangeRepeat(
    ChangeRepeat event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(isExpense: event.isExpense));
  }
}
