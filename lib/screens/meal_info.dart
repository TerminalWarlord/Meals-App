import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealInfoScreen extends StatelessWidget {
  const MealInfoScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.favorite),
          )
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.steps.map(
              (step) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  textAlign: TextAlign.center,
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
