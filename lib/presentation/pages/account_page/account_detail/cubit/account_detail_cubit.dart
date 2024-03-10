import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'account_detail_state.dart';

class AccountDetailCubit extends Cubit<AccountDetailState> {
  AccountDetailCubit() : super(const AccountDetailInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
