import 'package:bloc/bloc.dart';

class DropdownExpenseMethodCubit extends Cubit<int> {
  DropdownExpenseMethodCubit() : super(1);
  void changeIndex(int index) {
    emit(index - 1);
  }
}
