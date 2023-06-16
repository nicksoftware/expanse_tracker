import 'package:expanse_tracker/widgets/chart/chart.dart';
import 'package:expanse_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:expanse_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 250.00,
      date: DateTime.now(),
      category: Category.education,
    ),
    Expense(
        title: 'Cinema',
        amount: 450,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Food',
        amount: 450,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void saveExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Expense deleted',
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () => {
                  setState(
                    () => _registeredExpenses.insert(expenseIndex, expense),
                  ),
                }),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => NewExpense(
              onSave: saveExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    Widget content;

    if (deviceWidth > deviceHeight) {
      content = Row(
        children: [
          Expanded(
            flex: 2,
            child: Chart(expenses: _registeredExpenses),
          ),
          Expanded(
            flex: 3,
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: removeExpense,
            ),
          )
        ],
      );
    } else {
      content = Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: removeExpense,
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
