import 'package:expanse_tracker/models/expense.dart';
import 'package:expanse_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found, start adding some!'),
    );

    if (expenses.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
        ),
      );
    }

    return mainContent;
  }
}
