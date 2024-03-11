import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/utils/constrants/enums_.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageInitial()) {
    on<CustomHomepageEvent>(_onCustomHomepageEvent);
    on<ChangeTheFreq>(_changetheFreq);
    on<ChangeTheMonth>(_changeTheMonth);
  }
  final isar = IsarInstance();

  FutureOr<void> _onCustomHomepageEvent(
    CustomHomepageEvent event,
    Emitter<HomepageState> emit,
  ) {}
  //NOTE: change the freq
  FutureOr<void> _changetheFreq(
    ChangeTheFreq event,
    Emitter<HomepageState> emit,
  ) {
    if (event.se != state.se) {
      emit(state.copyWith(se: event.se));
    }
  }

  //! change the month
  FutureOr<void> _changeTheMonth(
    ChangeTheMonth event,
    Emitter<HomepageState> emit,
  ) async {
    if (event.month != state.currentMonth) {
      final total_balanceMonth = await isar.getTotalBalanceMonthly(event.month);
      final totalExpense = await isar.getTotalExpense(event.month);
      final totalIncome = await isar.getTotalIncome(event.month);
      emit(
        state.copyWith(
          currentMonth: event.month,
          income: totalIncome,
          expense: totalExpense,
          accountBalance: total_balanceMonth,
        ),
      );
    }
  }
}
