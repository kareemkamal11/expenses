import 'dart:developer';

import 'package:expenses/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key});

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final formaterr = DateFormat.yMd();
  DateTime? selectedDate;

  String warning = '';

  Category selectedCategory = Category.food;

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Add New Expense',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.purple,
                    )),
                const Spacer(),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'))
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              maxLength: 50,
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      prefixText: '\$',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  // create a date picker here with a textButtonicon
                  child: TextButton.icon(
                    onPressed: () async {
                      final timeNow = DateTime.now();
                      final firstDate = DateTime(
                          timeNow.year, timeNow.month - 1, timeNow.day);
                      final pickerdDate = await showDatePicker(
                        context: context,
                        initialDate: timeNow,
                        firstDate: firstDate,
                        lastDate: timeNow,
                      );
                      setState(() {
                        selectedDate = pickerdDate;
                      });
                    },
                    icon: const Icon(Icons.calendar_today),
                    label: Text(selectedDate == null
                        ? 'Choose Date'
                        : formaterr.format(selectedDate!)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            DropdownButton(
              value: selectedCategory,
              items: [
                ...Category.values.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  );
                }).toList()
              ],
              onChanged: (newVal) {
                setState(() {
                  if (newVal == null) {
                    return;
                  }
                  selectedCategory = newVal;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                log(titleController.text);
                log(amountController.text);

                titleController.text.isEmpty ||
                        amountController.text.isEmpty ||
                        selectedDate == null
                    ? setState(() {
                        warning = 'Please!, enter all Data';
                      })
                    : Navigator.of(context).pop();
              },
              child: const Text('Add Expense'),
            ),
            const SizedBox(height: 10),
            Text(
              warning,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ));
  }
}
