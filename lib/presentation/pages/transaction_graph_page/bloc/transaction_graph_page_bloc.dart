import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'transaction_graph_page_event.dart';
part 'transaction_graph_page_state.dart';

class TransactionGraphPageBloc extends Bloc<TransactionGraphPageEvent, TransactionGraphPageState> {
  TransactionGraphPageBloc() : super(const TransactionGraphPageInitial()) {
    on<CustomTransactionGraphPageEvent>(_onCustomTransactionGraphPageEvent);
  }

  FutureOr<void> _onCustomTransactionGraphPageEvent(
    CustomTransactionGraphPageEvent event,
    Emitter<TransactionGraphPageState> emit,
  ) {
    // TODO: Add Logic
  }
}
