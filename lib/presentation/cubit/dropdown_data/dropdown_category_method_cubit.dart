import 'package:bloc/bloc.dart';

class DropdownCategoryMethodCubit extends Cubit<String> {
  DropdownCategoryMethodCubit() : super('');

  void changeIndex(String value) {
    emit(value);
  }
}
