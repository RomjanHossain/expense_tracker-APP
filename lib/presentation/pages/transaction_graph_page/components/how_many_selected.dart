import 'package:expense_tracker/app/ui/src/colors.dart';
import 'package:expense_tracker/presentation/pages/profile_page/bloc/bloc.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/bloc/transaction_graph_page_bloc.dart';
import 'package:flutter/material.dart';

class HowManySelected extends StatefulWidget {
  const HowManySelected({
    super.key,
  });

  @override
  State<HowManySelected> createState() => _HowManySelectedState();
}

class _HowManySelectedState extends State<HowManySelected> {
  int selected = 0;

  // final selectedL =
  //     context.watch<TransactionGraphPageBloc>().state.categorySelected.length;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final x =
    //     context.watch<TransactionGraphPageBloc>().state.categorySelected.length;
    // if (x != selected) {
    //   setState(() {});
    // }
    return BlocConsumer<TransactionGraphPageBloc, TransactionGraphPageState>(
      listener: (BuildContext context, TransactionGraphPageState state) {
        debugPrint(
          "current stae lenght form selectedText : ${state.categorySelected.length}",
        );
        if (state.categorySelected.length != selected) {
          selected = state.categorySelected.length;
          setState(() {});
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Text('$selected Selected'),
            IconButton(
              onPressed: () {
                selected += 1;
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
            const Icon(
              Icons.navigate_next,
              color: ExpenseTrackerColors.violet,
            ),
          ],
        );
      },
    );
    // return Row(
    //   children: [
    //     Text('$selected Selected'),
    //     const Icon(
    //       Icons.navigate_next,
    //       color: ExpenseTrackerColors.violet,
    //     ),
    //   ],
    // );
  }
}
