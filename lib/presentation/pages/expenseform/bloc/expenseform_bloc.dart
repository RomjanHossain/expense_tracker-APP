import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/data/models/isar_entity/expense_entity/expense_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/income_entity/income_entity.dart';
import 'package:expense_tracker/data/models/isar_entity/transfer_entity/transfer_entity.dart';
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
    on<ChangeAccountEntity>(_onAccountEntityChange);
    //! WARNING: for database
    on<TransferToDatbase>(_onTransferToDatbase);
    on<IncomeToDatabase>(_onIncomeToDatbase);
    on<ExpenseToDatabase>(_onExpenseToDatbase);
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

  //NOTE: change the acount
  FutureOr<void> _onAccountEntityChange(
    ChangeAccountEntity event,
    Emitter<ExpenseformState> emit,
  ) {
    if (event.accountEntity != state.accountEntity) {
      emit(state.copyWith(accountEntity: event.accountEntity));
    }
  }

  // // change income source id
  // FutureOr<void> _onChangeIncomeSourceId(
  //   ChangeIncomeSourceId event,
  //   Emitter<ExpenseformState> emit,
  // ) {
  //   emit(state.copyWith(incomeSourceId: event.incomeSourceId));
  // }

  //NOTE: change subscription start date
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

  //NOTE: change subscription end date
  FutureOr<void> _onChangeSubEnd(
    ChangeSubEnd event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(subEnd: event.subEnd));
  }

  //NOTE: change subscription type
  FutureOr<void> _onChangeSubType(
    ChangeSubType event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(subType: event.subType));
  }

  //NOTE: change repeat
  FutureOr<void> _onChangeRepeat(
    ChangeRepeat event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(state.copyWith(isExpense: event.isExpense));
  }

  //NOTE: reset
  FutureOr<void> _onResetExpenseForm(
    ResetExpenseForm event,
    Emitter<ExpenseformState> emit,
  ) {
    emit(const ExpenseformInitial());
  }

  //! WARNING: for database implentation
  FutureOr<void> _onTransferToDatbase(
    TransferToDatbase event,
    Emitter<ExpenseformState> emit,
  ) async {
    final isar = IsarInstance();
    await isar.createAnTransfer(event.transferAmount);
    emit(const SuccessfullyAddedToDatabase());
  }

  FutureOr<void> _onIncomeToDatbase(
    IncomeToDatabase event,
    Emitter<ExpenseformState> emit,
  ) async {
    final isar = IsarInstance();
    await isar.createAnIncome(event.incomeAmount);
    emit(const SuccessfullyAddedToDatabase());
  }

  FutureOr<void> _onExpenseToDatbase(
    ExpenseToDatabase event,
    Emitter<ExpenseformState> emit,
  ) async {
    final isar = IsarInstance();
    await isar.createAnExpense(event.expenseAmount);
    emit(const SuccessfullyAddedToDatabase());
  }
}
