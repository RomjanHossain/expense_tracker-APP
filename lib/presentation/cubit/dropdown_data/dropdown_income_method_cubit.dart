import 'package:bloc/bloc.dart';

class DropdownIncomeMethodCubit extends Cubit<String> {
  DropdownIncomeMethodCubit() : super('');

  void changeValue(String index) {
    emit(index);
  }
}
