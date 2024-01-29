part of 'profile_page_bloc.dart';

/// {@template profile_page_state}
/// ProfilePageState description
/// {@endtemplate}
class ProfilePageState extends Equatable {
  /// {@macro profile_page_state}
  const ProfilePageState({
    this.customProperty = 'Profile Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ProfilePageState with property changes
  ProfilePageState copyWith({
    String? customProperty,
  }) {
    return ProfilePageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template profile_page_initial}
/// The initial state of ProfilePageState
/// {@endtemplate}
class ProfilePageInitial extends ProfilePageState {
  /// {@macro profile_page_initial}
  const ProfilePageInitial() : super();
}
