import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'budget_event.dart';
part 'budget_state.dart';

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc() : super(const BudgetInitial()) {
    on<CustomBudgetEvent>(_onCustomBudgetEvent);
  }

  FutureOr<void> _onCustomBudgetEvent(
    CustomBudgetEvent event,
    Emitter<BudgetState> emit,
  ) {
    // TODO: Add Logic
  }
}
