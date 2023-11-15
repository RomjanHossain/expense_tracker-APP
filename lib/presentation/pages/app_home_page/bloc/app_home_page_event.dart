part of 'app_home_page_bloc.dart';

abstract class AppHomePageEvent  extends Equatable {
  const AppHomePageEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_app_home_page_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class ChangeAppHomePageEvent extends AppHomePageEvent {
  /// {@macro custom_app_home_page_event}
  const ChangeAppHomePageEvent(this.index);
  final int index;
}
