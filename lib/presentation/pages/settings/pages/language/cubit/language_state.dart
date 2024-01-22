part of 'language_cubit.dart';

/// {@template language}
/// LanguageState description
/// {@endtemplate}
class LanguageState extends Equatable {
  /// {@macro language}
  const LanguageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current LanguageState with property changes
  LanguageState copyWith({
    String? customProperty,
  }) {
    return LanguageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template language_initial}
/// The initial state of LanguageState
/// {@endtemplate}
class LanguageInitial extends LanguageState {
  /// {@macro language_initial}
  const LanguageInitial() : super();
}

// bangla language
class LanguageBangla extends LanguageState {
  const LanguageBangla() : super();
}
// english language
class LanguageEnglish extends LanguageState {
  const LanguageEnglish() : super();
}