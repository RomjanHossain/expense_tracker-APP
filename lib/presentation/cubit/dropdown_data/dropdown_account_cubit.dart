import 'package:expense_tracker/data/models/drifts/app_db/app_database.dart';
import 'package:expense_tracker/domain/repositories/drift_repository.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';

class DropdownAccountCubit extends Cubit<(List<Account>, Account?)> {
  DropdownAccountCubit() : super(([], null));

  Future<void> runOnFirst() async {
    // final isarI = IsarInstance();
    // final listOfAc = await isarI.getListOfAccount();
    final listOfAc = await DriftRepository().getListOfAccount();
    emit((listOfAc, null));
  }

  /// chagne the selected account
  void changeSelectedAccount(Account? account) {
    print('len -> ${state.$1.length}');
    emit((state.$1, account));
  }
}
