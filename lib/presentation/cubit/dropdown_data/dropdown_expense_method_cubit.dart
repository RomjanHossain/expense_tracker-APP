import 'package:bloc/bloc.dart';

class DropdownExpenseMethodCubit extends Cubit<String> {
  DropdownExpenseMethodCubit() : super('');
  void changeValue(String index) {
    emit(index);
  }
}
