import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  leisure,
  work,
  education,
}

class Expense {
  String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  static const categoryIcons = {
    Category.food: Icons.lunch_dining,
    Category.education: Icons.cast_for_education,
    Category.travel: Icons.flight_takeoff,
    Category.leisure: Icons.movie,
    Category.work: Icons.work,
  };

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}
