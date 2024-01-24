import 'package:expenses/models/expenses.dart';
import 'package:expenses/widgets/expenses_list/expenses_list.dart';
import 'package:expenses/widgets/new_epenses.dart';
import 'package:flutter/material.dart';

class PageExpenses extends StatefulWidget {
  const PageExpenses({super.key});

  @override
  State<PageExpenses> createState() => _PageExpensesState();
}

class _PageExpensesState extends State<PageExpenses> {
  List<Expense> expenses = [
    Expense(
        category: Category.work,
        title: 'Flutter Course',
        amount: 29.9,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Cinema',
        amount: 9.71,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: 'Breakfast',
        amount: 31.3,
        date: DateTime.now()),
  ];

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(
              expenses: expenses,
              onRemoveExpense: removeExpense,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) => SizedBox(
              height: 500,
              child: NewExpenses(
                onAddExpense: addExpense,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
