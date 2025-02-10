import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
part 'account_state.dart';

class AccountCubit
    extends Cubit<(double accountBalance, List<Account> accounts)> {
  AccountCubit()
      : super(
          (0.00, []),
        );

  //! NOTE: run at first launch
  FutureOr<void> runAtFirst() async {
    final isar = DriftRepository();
    final acs = await isar.getListOfAccount();
    final tb = await isar.getTotalBalance();
    emit((tb, acs));
  }

  /// A description for yourCustomFunction
  FutureOr<void> yourCustomFunction() {}
}
