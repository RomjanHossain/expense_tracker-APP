import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'expensedetails_state.dart';

class ExpensedetailsCubit extends Cubit<ExpensedetailsState> {
  ExpensedetailsCubit() : super(const ExpensedetailsInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
