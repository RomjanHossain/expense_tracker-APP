import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'expenseform_event.dart';
part 'expenseform_state.dart';

class ExpenseformBloc extends Bloc<ExpenseformEvent, ExpenseformState> {
  ExpenseformBloc() : super(const ExpenseformInitial()) {
    on<CustomExpenseformEvent>(_onCustomExpenseformEvent);
  }

  FutureOr<void> _onCustomExpenseformEvent(
    CustomExpenseformEvent event,
    Emitter<ExpenseformState> emit,
  ) {
    // TODO: Add Logic
  }
}
