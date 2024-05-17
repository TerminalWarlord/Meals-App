import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id,
      required this.title,
      this.color = Colors.deepOrangeAccent});

  final String id;
  final Color color;
  final String title;
}
