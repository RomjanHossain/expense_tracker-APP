import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
part 'expensereport_event.dart';
part 'expensereport_state.dart';

class ExpensereportBloc extends Bloc<ExpensereportEvent, ExpensereportState> {
  ExpensereportBloc() : super(const ExpensereportInitial()) {
    on<CustomExpensereportEvent>(_onCustomExpensereportEvent);
    on<ChangeExpenseType>(_changeETypeEvent);
    on<ChangeChartType>(_changeCTypeEvent);
  }

  FutureOr<void> _onCustomExpensereportEvent(
    CustomExpensereportEvent event,
    Emitter<ExpensereportState> emit,
  ) {
    // TODO: Add Logic
  }

  /// change e type

  FutureOr<void> _changeETypeEvent(
    ChangeExpenseType event,
    Emitter<ExpensereportState> emit,
  ) {
    if (state.etype != event.etype) {
      emit(state.copyWith(etype: event.etype));
    }
  }

  /// chagne c type
  FutureOr<void> _changeCTypeEvent(
    ChangeChartType event,
    Emitter<ExpensereportState> emit,
  ) {
    if (state.chartType != event.chartType) {
      emit(state.copyWith(chartType: event.chartType));
    }
  }
}
