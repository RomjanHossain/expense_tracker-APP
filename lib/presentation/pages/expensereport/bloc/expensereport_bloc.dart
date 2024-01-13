import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'expensereport_event.dart';
part 'expensereport_state.dart';

class ExpensereportBloc extends Bloc<ExpensereportEvent, ExpensereportState> {
  ExpensereportBloc() : super(const ExpensereportInitial()) {
    on<CustomExpensereportEvent>(_onCustomExpensereportEvent);
  }

  FutureOr<void> _onCustomExpensereportEvent(
    CustomExpensereportEvent event,
    Emitter<ExpensereportState> emit,
  ) {
    // TODO: Add Logic
  }
}
