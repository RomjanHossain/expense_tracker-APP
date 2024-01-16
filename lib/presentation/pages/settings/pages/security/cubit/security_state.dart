part of 'security_cubit.dart';

/// {@template security}
/// SecurityState description
/// {@endtemplate}
class SecurityState extends Equatable {
  /// {@macro security}
  const SecurityState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current SecurityState with property changes
  SecurityState copyWith({
    String? customProperty,
  }) {
    return SecurityState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template security_initial}
/// The initial state of SecurityState
/// {@endtemplate}
class SecurityInitial extends SecurityState {
  /// {@macro security_initial}
  const SecurityInitial() : super();
}
