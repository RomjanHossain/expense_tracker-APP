import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/presentation/pages/createbudget/model/create_budget_entity.dart';
part 'createbudget_state.dart';

class CreatebudgetCubit extends Cubit<CreatebudgetState> {
  CreatebudgetCubit() : super(const CreatebudgetInitial());

  /// change amount
  FutureOr<void> changeAmmount(double ammount) {
    emit(
      state.copyWith(
        ammount: ammount,
      ),
    );
  }

  /// change category
  FutureOr<void> changeCategory(String cat) {
    emit(
      state.copyWith(
        cat: cat,
      ),
    );
  }

  /// change isAlert
  FutureOr<void> activeAlert() {
    emit(
      state.copyWith(
        isAlert: true,
      ),
    );
  }

  FutureOr<void> deactiveAlert() {
    emit(
      state.copyWith(
        isAlert: false,
      ),
    );
  }

  /// change percent
  FutureOr<void> changePercent(double percent) {
    emit(
      state.copyWith(
        percent: percent,
      ),
    );
  }
}
