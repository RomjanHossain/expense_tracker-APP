import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'exportdata_state.dart';

class ExportdataCubit extends Cubit<ExportdataState> {
  ExportdataCubit() : super(const ExportdataInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
