part of 'security_cubit.dart';

/// {@template security}
/// SecurityState description
/// {@endtemplate}
class SecurityState extends Equatable {
  /// {@macro security}
  const SecurityState({
    this.securityFingerprint = false,
    this.securityPin = true,
  });

  /// security pin
  final bool securityPin;
  /// security fingerprint
  final bool securityFingerprint;

  @override
  List<Object> get props => [
    securityPin,
    securityFingerprint,
  ];

  /// Creates a copy of the current SecurityState with property changes
  SecurityState copyWith({
    bool? securityPin,
    bool? securityFingerprint,
  }) {
    return SecurityState(
      securityPin: securityPin ?? this.securityPin,
      securityFingerprint: securityFingerprint ?? this.securityFingerprint,
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
