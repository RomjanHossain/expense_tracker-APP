import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/exportdata/cubit/cubit.dart';
import 'package:expense_tracker/presentation/pages/exportdata/widgets/exportdata_body.dart';
import 'package:expense_tracker/core/utils/utils.dart';
import 'package:flutter/material.dart';

/// {@template exportdata_page}
/// A description for ExportdataPage
/// {@endtemplate}
class ExportdataPage extends StatelessWidget {
  /// {@macro exportdata_page}
  const ExportdataPage({super.key});

  /// The static route for ExportdataPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ExportdataPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExportdataCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode(context)
              ? ExpenseTrackerColors.dark
              : ExpenseTrackerColors.light,
          title: const Text('Export Data'),
          centerTitle: true,
        ),
        body: const ExportdataView(),
      ),
    );
  }
}

/// {@template exportdata_view}
/// Displays the Body of ExportdataView
/// {@endtemplate}
class ExportdataView extends StatelessWidget {
  /// {@macro exportdata_view}
  const ExportdataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExportdataBody();
  }
}
