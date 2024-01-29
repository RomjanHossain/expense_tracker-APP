import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/domain/entities/expense_form_entity/expense_form_entity.dart';
part 'expenseform_event.dart';
part 'expenseform_state.dart';

class ExpenseformBloc extends Bloc<ExpenseformEvent, ExpenseformState> {
  ExpenseformBloc() : super(const ExpenseformInitial()) {
    on<CustomExpenseformEvent>(_onCustomExpenseformEvent);
    // on<ChangeExpenseId>(_onChangeExpenseId);
    // on<ChangeIncomeSourceId>(_onChangeIncomeSourceId);
    on<ChangeRepeat>(_onChangeRepeat);
    on<ChangeSubEnd>(_onChangeSubEnd);
    on<ChangeSubStart>(_onChangeSubStart);
    // on<ChangeSubStartMonth>(_onChangeSubStartMonth);
    on<ChangeSubType>(_onChangeSubType);
    on<ResetExpenseForm>(_onResetExpenseForm);
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

  // change subscription start date
  FutureOr<void> _onChangeSubStart(
    ChangeSubStart event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(subStart: event.subStart));
  }

  // change subscription start month
  // FutureOr<void> _onChangeSubStartMonth(
  //   ChangeSubStartMonth event,
  //   Emitter<ExpenseformState> emit,
  // ) {
  //   emit(state.copyWith(subStartMonth: event.subStartMonth));
  // }

  // change subscription end date
  FutureOr<void> _onChangeSubEnd(
    ChangeSubEnd event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(subEnd: event.subEnd));
  }

  // change subscription type
  FutureOr<void> _onChangeSubType(
    ChangeSubType event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(subType: event.subType));
  }

  // change repeat
  FutureOr<void> _onChangeRepeat(
    ChangeRepeat event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(isExpense: event.isExpense));
  }
  // reset
  FutureOr<void> _onResetExpenseForm(
    ResetExpenseForm event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(const ExpenseformInitial());
  }
}
