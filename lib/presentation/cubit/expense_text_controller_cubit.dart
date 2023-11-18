import 'package:bloc/bloc.dart';

class ExpenseTextControllerCubit extends Cubit<String> {
  ExpenseTextControllerCubit() : super('0.00');

  // add text
  void addText(String text) {
    if (state == '0.00') {
      emit(text);
    } else {
      emit(state + text);
    }
  }

  // remove text
  void removeText() {
    if (state.length > 1) {
      emit(state.substring(0, state.length - 1));
    } else {
      emit('0.00');
    }
  }

  // clear text
  void clearText() {
    emit('0.00');
  }
}
