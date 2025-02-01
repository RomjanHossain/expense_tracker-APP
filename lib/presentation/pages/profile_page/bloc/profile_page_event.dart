part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent  extends Equatable {
  const ProfilePageEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_profile_page_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomProfilePageEvent extends ProfilePageEvent {
  /// {@macro custom_profile_page_event}
  const CustomProfilePageEvent();
}
