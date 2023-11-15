import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'borrow_or_lend_page_event.dart';
part 'borrow_or_lend_page_state.dart';

class BorrowOrLendPageBloc extends Bloc<BorrowOrLendPageEvent, BorrowOrLendPageState> {
  BorrowOrLendPageBloc() : super(const BorrowOrLendPageInitial()) {
    on<CustomBorrowOrLendPageEvent>(_onCustomBorrowOrLendPageEvent);
  }

  FutureOr<void> _onCustomBorrowOrLendPageEvent(
    CustomBorrowOrLendPageEvent event,
    Emitter<BorrowOrLendPageState> emit,
  ) {
    // TODO: Add Logic
  }
}
