import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'createbudget_state.dart';

class CreatebudgetCubit extends Cubit<CreatebudgetState> {
  CreatebudgetCubit() : super(const CreatebudgetInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
