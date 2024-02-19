import 'package:expense_tracker/app/ui/app_ui.dart';
import 'package:expense_tracker/presentation/pages/exportdata/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template exportdata_body}
/// Body of the ExportdataPage.
///
/// Add what it does
/// {@endtemplate}
class ExportdataBody extends StatelessWidget {
  /// {@macro exportdata_body}
  const ExportdataBody({super.key});

  @override
  Widget build(BuildContext context) {
    final questionStyle = ExpenseTrackerTextStyle.body1.copyWith(
      color: ExpenseTrackerColors.dark75,
      fontWeight: FontWeight.w400,
    );
    return BlocBuilder<ExportdataCubit, ExportdataState>(
      builder: (context, state) {
        // return Center(child: Text(state.customProperty));
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What data do your want to export?',
                style: questionStyle,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 20.h,
                ),
                child: DropdownButtonFormField(
                  items: const [],
                  onChanged: (_) {},
                  borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
                  // underline: Container(),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.violet,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.light60,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.light60,
                      ),
                    ),
                    // helperText: 'All',
                  ),
                  alignment: Alignment.centerLeft,
                  hint: const Text(
                    'ALL',
                    style: TextStyle(
                      color: ExpenseTrackerColors.light20,
                    ),
                  ),
                  dropdownColor:
                      ExpenseTrackerColors.violet, // Dropdown open Color
                ),
              ),
              Text(
                'When date range?',
                style: questionStyle,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 20.h,
                ),
                child: DropdownButtonFormField(
                  items: const [],
                  onChanged: (_) {},
                  borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
                  // underline: Container(),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.violet,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.light60,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.light60,
                      ),
                    ),
                    // helperText: 'All',
                  ),
                  alignment: Alignment.centerLeft,
                  hint: const Text(
                    'ALL',
                    style: TextStyle(
                      color: ExpenseTrackerColors.light20,
                    ),
                  ),
                  dropdownColor:
                      ExpenseTrackerColors.violet, // Dropdown open Color
                ),
              ),
              Text(
                'What format do you want to export?',
                style: questionStyle,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 20.h,
                ),
                child: DropdownButtonFormField(
                  items: const [],
                  onChanged: (_) {},
                  borderRadius: ExpenseTrackerTheme.borderRadiusExtraLarge,
                  // underline: Container(),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.violet,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.light60,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: ExpenseTrackerColors.light60,
                      ),
                    ),
                    // helperText: 'All',
                  ),
                  alignment: Alignment.centerLeft,
                  hint: const Text(
                    'ALL',
                    style: TextStyle(
                      color: ExpenseTrackerColors.light20,
                    ),
                  ),
                  dropdownColor:
                      ExpenseTrackerColors.violet, // Dropdown open Color
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  foregroundColor: ExpenseTrackerColors.light,
                  backgroundColor: ExpenseTrackerColors.violet,
                  shape: const RoundedRectangleBorder(
                    borderRadius: ExpenseTrackerTheme.borderRadiusSmall,
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.arrow_down_to_line),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text('Export'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
