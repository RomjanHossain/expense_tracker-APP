import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/dropdown_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/ie_small_card.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/segmented_button_wid.dart';
import 'package:expense_tracker/presentation/pages/homepage/widgets/homepage_body.dart';
import 'package:expense_tracker/presentation/widgets/charts/line_charts.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
import 'package:expense_tracker/utils/utils_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// {@template homepage_page}
/// A description for HomepagePage
/// {@endtemplate}
class HomepagePage extends StatefulWidget {
  /// {@macro homepage_page}
  const HomepagePage({super.key});

  /// The static route for HomepagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomepagePage());
  }

  @override
  State<HomepagePage> createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  String? dpValue = calanderMonths[0];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomepageBloc(),
      child: const Scaffold(
        // backgroundColor: Colors.red,
        body: HomepageView(),
      ),
    );
  }
}

/// {@template homepage_view}
/// Displays the Body of HomepageView
/// {@endtemplate}
class HomepageView extends StatelessWidget {
  /// {@macro homepage_view}
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomepageBody();
  }
}
