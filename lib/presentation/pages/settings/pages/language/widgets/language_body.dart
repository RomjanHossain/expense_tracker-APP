import 'package:expense_tracker/presentation/pages/settings/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/language/cubit/language_cubit.dart';
import 'package:expense_tracker/presentation/pages/settings/pages/theme/components/checkmark_circle.dart';
import 'package:flutter/material.dart';

/// {@template language_body}
/// Body of the LanguagePage.
///
/// Add what it does
/// {@endtemplate}
class LanguageBody extends StatelessWidget {
  /// {@macro language_body}
  const LanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                context.read<LanguageCubit>().useBanglaLanguage();
              },
              title: const Text('Bangla (BN)'),
              trailing: state is LanguageBangla ? const CheckMark() : null,
            ),
            ListTile(
              title: const Text('English (EN)'),
              onTap: () {
                context.read<LanguageCubit>().useEnglishLanguage();
              },
              trailing: state is LanguageEnglish ? const CheckMark() : null,
            ),
          ],
        );
      },
    );
  }
}
