import 'package:bloc/bloc.dart';

class DropdownCategoryMethodCubit extends Cubit<int> {
  DropdownCategoryMethodCubit() : super(0);

  void changeIndex(int index) {
    emit(index-1);
  }
}
