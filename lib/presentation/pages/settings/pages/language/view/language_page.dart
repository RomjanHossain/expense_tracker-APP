import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/cubit/language_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/widgets/language_body.dart';
import 'package:flutter/material.dart';

/// {@template language_page}
/// A description for LanguagePage
/// {@endtemplate}
class LanguagePage extends StatelessWidget {
  /// {@macro language_page}
  const LanguagePage({super.key});

  /// The static route for LanguagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LanguagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: const Scaffold(
        body: LanguageView(),
      ),
    );
  }    
}

/// {@template language_view}
/// Displays the Body of LanguageView
/// {@endtemplate}
class LanguageView extends StatelessWidget {
  /// {@macro language_view}
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LanguageBody();
  }
}
