import 'package:expanse_tracker/models/expense.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses =
            allExpenses.where((exp) => exp.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
