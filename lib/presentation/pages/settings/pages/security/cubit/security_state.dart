part of 'security_cubit.dart';

/// {@template security}
/// SecurityState description
/// {@endtemplate}
class SecurityState extends Equatable {
  /// {@macro security}
   const SecurityState({
    this.security = const ['Pin', 'Fingerprint',],
  });

  /// A description for security
  final List<String> security;

  @override
  List<Object> get props => [security];

  /// Creates a copy of the current SecurityState with property changes
  SecurityState copyWith({
    String newSecurity
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
