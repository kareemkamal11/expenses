import 'package:expenses/models/expenses.dart';
import 'package:flutter/material.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpensesBucket> get buckets {
    return [
      ExpensesBucket.forCategory(expenses, Category.food),
      ExpensesBucket.forCategory(expenses, Category.travel),
      ExpensesBucket.forCategory(expenses, Category.leisure),
      ExpensesBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpenses {
    double maxTotalExpenses = 0;

    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpenses) {
        maxTotalExpenses = element.totalExpenses;
      }
    }
    return maxTotalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final ele in buckets)
                ChartBar(
                    fill: ele.totalExpenses == 0
                        ? 0
                        : ele.totalExpenses / maxTotalExpenses),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Row(
            children: buckets
                .map((bucket) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          categoryIcons[bucket.category],
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ]),
    );
  }
}
