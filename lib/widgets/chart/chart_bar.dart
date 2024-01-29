import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FractionallySizedBox(
        heightFactor: fill,
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary.withOpacity(0.6),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          ),
        ),
      ),
    ));
  }
}
