import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/choose_cat_sheet.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/components/how_many_selected.dart';
import 'package:expense_tracker/presentation/pages/transaction_graph_page/transaction_graph_page.dart';
import 'package:flutter/material.dart';

class SelectCateogries extends StatelessWidget {
  const SelectCateogries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<TransactionGraphPageBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Choose Category'),
          GestureDetector(
            onTap: () async {
              //NOTE: show bottom sheet of categories (categoryLocalData2)
              await showModalBottomSheet<void>(
                isScrollControlled: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                context: context,
                builder: (context) => ChooseCategorySheet(
                  categorySelected: state.categorySelected,
                ),
              );
            },
            child: const HowManySelected(),
          ),
        ],
      ),
    );
  }
}
