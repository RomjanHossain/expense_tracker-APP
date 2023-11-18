import 'package:bloc/bloc.dart';

class DropdownExpenseMethodCubit extends Cubit<int> {
  DropdownExpenseMethodCubit() : super(0);
  void changeIndex(int index) {
    emit(index - 1);
  }
}
