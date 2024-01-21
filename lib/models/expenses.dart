import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final dateFormat = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.other: Icons.attach_money,
};

enum Category { food, travel, leisure, work, other }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  

  String get formattedDate => dateFormat.format(date);

  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

}
