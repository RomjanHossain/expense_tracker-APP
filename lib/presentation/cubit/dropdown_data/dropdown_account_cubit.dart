import 'package:expense_tracker/data/datasources/local/isar_instance.dart';
import 'package:expense_tracker/data/models/isar_entity/create_account/create_account_isar.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';

class DropdownAccountCubit
    extends Cubit<(List<AccountEntity>, AccountEntity?)> {
  DropdownAccountCubit() : super(([], null));

  Future<void> runOnFirst() async {
    final isarI = IsarInstance();
    final listOfAc = await isarI.getListOfAccount();
    emit((listOfAc, null));
  }

  /// chagne the selected account
  void changeSelectedAccount(AccountEntity? account) {
    print('len -> ${state.$1.length}');
    emit((state.$1, account));
  }
}
