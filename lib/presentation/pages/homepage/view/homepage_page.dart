import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/app/ui/src/assets/assets_icons_n_illustration.dart';
import 'package:expense_tracker/data/datasources/local/utils_data/all_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/dropdown_months.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/expense_graph.dart';
import 'package:expense_tracker/presentation/pages/homepage/components/ie_small_card.dart';
import 'package:expense_tracker/presentation/pages/homepage/widgets/homepage_body.dart';
import 'package:expense_tracker/utils/constrants/consts_.dart';
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
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250.h,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0x0ffff6e5),
                        Color(0xffF8EDD8),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Balance',
                        style: ExpenseTrackerTextStyle.regular3.copyWith(
                          color: ExpenseTrackerColors.light20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        child: Text(
                          r'$1000',
                          style: ExpenseTrackerTextStyle.title1.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      height10,
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const IESmallCard(
                              svgAsset: ExpenseAssets.incomeIcon,
                              color: ExpenseTrackerColors.green,
                              title: 'Income',
                              money: '2024',
                            ),
                            width10,
                            const IESmallCard(
                              svgAsset: ExpenseAssets.expenseIcon,
                              color: ExpenseTrackerColors.red,
                              title: 'Expense',
                              money: '2023',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              title: const DropdownMonths(),
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: ExpenseTrackerColors.violet,
                ),
              ),
              actions: [
                SvgPicture.asset(
                  ExpenseAssets.notificationIcon,
                  color: ExpenseTrackerColors.violet,
                  height: 24.h,
                ),
              ],
              // bottom: PreferredSize(
              //   preferredSize: const Size.fromHeight(100),
              //   child: Container(
              //     color: Colors.lime,
              //     margin: const EdgeInsets.only(bottom: 10),
              //     child: const Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Text(
              //           'Account Balance',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Text(
              //           '\$1000',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Row(
              //           children: [
              //             Text('income'),
              //             Text('expense'),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
            // a graph for showing todays expense
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15).h,
                      child: Text(
                        'Spend Frequency',
                        style: ExpenseTrackerTextStyle.title3.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: HomeExpenseGraph(),
                    ),
                  ],
                ),
              ),
            ),

            ///* segmented buttons
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20).h,
                child: SegmentedButton<SegmentedButtonsData>(
                  showSelectedIcon: false,
                  style: ButtonStyle(
                    // textStyle: MaterialStateProperty.resolveWith(
                    //     (states) => ExpenseTrackerTextStyle.regular3.copyWith(
                    //           color: states.contains(MaterialState.selected)
                    //               ? ExpenseTrackerColors.yellow
                    //               : ExpenseTrackerColors.light20,
                    //           fontWeight:
                    //               states.contains(MaterialState.selected)
                    //                   ? FontWeight.bold
                    //                   : FontWeight.normal,
                    //         )),
                    side: MaterialStateProperty.all(
                      BorderSide.none,
                    ),
                    // backgroundColor: MaterialStateProperty.all(
                    //   ExpenseTrackerColors.yellow20,
                    // ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => states.contains(MaterialState.selected)
                          ? ExpenseTrackerColors.yellow20
                          : ExpenseTrackerColors.scaffoldBackground,
                    ),
                  ),
                  segments: [
                    const ButtonSegment<SegmentedButtonsData>(
                      label: Text(
                        'Today',
                        // style: ExpenseTrackerTextStyle.regular3.copyWith(
                        //   color: ExpenseTrackerColors.yellow,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      value: SegmentedButtonsData.today,
                    ),
                    const ButtonSegment<SegmentedButtonsData>(
                      label: Text('Week'),
                      value: SegmentedButtonsData.week,
                    ),
                    const ButtonSegment<SegmentedButtonsData>(
                      label: Text('Month'),
                      value: SegmentedButtonsData.month,
                    ),
                    const ButtonSegment<SegmentedButtonsData>(
                      label: Text('Year'),
                      value: SegmentedButtonsData.year,
                    ),
                  ],
                  selected: const {SegmentedButtonsData.today},
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: HomepageView(),
            ),
            SliverList.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final now = DateTime.now();
                return ListTile(
                  title: Text('${calanderMonths[now.month - 1]} data $index'),
                );
              },
            ),
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
