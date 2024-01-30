part of 'exportdata_cubit.dart';

/// {@template exportdata}
/// ExportdataState description
/// {@endtemplate}
class ExportdataState extends Equatable {
  /// {@macro exportdata}
  const ExportdataState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ExportdataState with property changes
  ExportdataState copyWith({
    String? customProperty,
  }) {
    return ExportdataState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template exportdata_initial}
/// The initial state of ExportdataState
/// {@endtemplate}
class ExportdataInitial extends ExportdataState {
  /// {@macro exportdata_initial}
  const ExportdataInitial() : super();
}
