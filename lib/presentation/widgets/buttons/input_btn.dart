import 'package:expense_tracker/presentation/widgets/buttons/single_btn.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {

  ButtonRow(this.buttons);
  final List<Button> buttons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, b) {
          list.isEmpty
              ? list.add(b)
              : list.addAll([const SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}
