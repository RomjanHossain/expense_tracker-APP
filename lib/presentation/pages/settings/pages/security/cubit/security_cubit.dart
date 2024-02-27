
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/data/datasources/local/shared_pref/settings_data.dart';
part 'security_state.dart';

class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit() : super(const SecurityInitial());

  SettingsLocalDataSourcePref settingsLocalDataSourcePref = SettingsLocalDataSourcePref();
  /// get default 
}
