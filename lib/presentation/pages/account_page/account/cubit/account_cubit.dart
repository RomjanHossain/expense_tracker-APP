import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
part 'account_state.dart';

class AccountCubit
    extends Cubit<(double accountBalance, List<AccountEntity> accounts)> {
  AccountCubit()
      : super(
          (0.00, []),
        );

  //! NOTE: run at first launch
  FutureOr<void> runAtFirst() async {
    final isar = IsarInstance();
    final acs = await isar.getListOfAccount();
    final tb = await isar.getTotalBalance();
    emit((tb, acs));
  }

  /// A description for yourCustomFunction
  FutureOr<void> yourCustomFunction() {}
}
