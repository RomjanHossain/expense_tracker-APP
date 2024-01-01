import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/widgets/homepage_body.dart';
import 'package:flutter/material.dart';
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
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.0,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ExpenseTrackerColors.violet,
                        ExpenseTrackerColors.blue,
                      ],
                    ),
                  ),
                ),
              ),
              title: DropdownButtonHideUnderline(
                child: DropdownButton(
                  alignment: Alignment.center,
                  elevation: 0,
                  isExpanded: true,
                  // value: calanderMonths[0],
                  // value: dpValue,
                  // hint: const Text('Select Month'),
                  items: calanderMonths
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
              leading: const CircleAvatar(),
              actions: [
                SvgPicture.asset(
                  ExpenseAssets.notificationIcon,
                  color: ExpenseTrackerColors.violet,
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Container(
                  color: Colors.lime,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Account Balance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$1000',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text('income'),
                          Text('expense'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: HomepageView(),
            ),
            SliverList.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('data $index'),
                );
              },
            )
          ],
        ),
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
