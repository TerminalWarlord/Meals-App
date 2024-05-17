import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealInfo extends StatelessWidget {
  const MealInfo({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: const Text('INFO SCREEN'),
    );
  }
}
