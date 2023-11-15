import 'package:flutter/material.dart';

class AddTransactionBottomSheet extends StatelessWidget {
  const AddTransactionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Show Cash or Card or Bank or Mobile Banking or Crypto
        /// also show which category it belongs
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Text('Cash'),
            DropdownMenu(
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 0, label: "Cash"),
                DropdownMenuEntry(value: 1, label: "Card"),
                DropdownMenuEntry(value: 2, label: "Bank"),
              ],
            ),
            Text('Cats'),
          ],
        ),

        /// Show the type [Expense] or [Income] or [Borrowed] or [Lent]
        Text("Expenses"),

        /// User inputed amount
        Row(
          children: [
            Text("\$"),
            Text("254.22"),
          ],
        ),

        /// User inputed description
        Text("Add comment"),

        /// Calculator like number buttons
      ],
    );
  }
}
