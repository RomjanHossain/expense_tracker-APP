import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template profile_page_body}
/// Body of the ProfilePagePage.
///
/// Add what it does
/// {@endtemplate}
class ProfilePageBody extends StatelessWidget {
  /// {@macro profile_page_body}
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageBloc, ProfilePageState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
