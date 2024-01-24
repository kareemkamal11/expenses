import 'package:expenses/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpensesItmes extends StatelessWidget {
  const ExpensesItmes({
    super.key,
    required this.expenseIndex,
  });

  final Expense expenseIndex;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(categoryIcons[expenseIndex.category]),
        ),
        title: Text(expenseIndex.title),
        subtitle: Text(expenseIndex.formattedDate),
        trailing: Text(expenseIndex.amount.toStringAsFixed(2)),
      ),
    );
  }
}
