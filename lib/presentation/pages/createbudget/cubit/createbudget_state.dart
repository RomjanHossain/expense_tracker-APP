part of 'createbudget_cubit.dart';

/// {@template createbudget}
/// CreatebudgetState description
/// {@endtemplate}
class CreatebudgetState extends Equatable {
  /// {@macro createbudget}
  const CreatebudgetState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CreatebudgetState with property changes
  CreatebudgetState copyWith({
    String? customProperty,
  }) {
    return CreatebudgetState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template createbudget_initial}
/// The initial state of CreatebudgetState
/// {@endtemplate}
class CreatebudgetInitial extends CreatebudgetState {
  /// {@macro createbudget_initial}
  const CreatebudgetInitial() : super();
}
