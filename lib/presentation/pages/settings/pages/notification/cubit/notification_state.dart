part of 'notification_cubit.dart';

/// {@template notification}
/// NotificationState description
/// {@endtemplate}
class NotificationState extends Equatable {
  /// {@macro notification}
  const NotificationState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current NotificationState with property changes
  NotificationState copyWith({
    String? customProperty,
  }) {
    return NotificationState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template notification_initial}
/// The initial state of NotificationState
/// {@endtemplate}
class NotificationInitial extends NotificationState {
  /// {@macro notification_initial}
  const NotificationInitial() : super();
}
