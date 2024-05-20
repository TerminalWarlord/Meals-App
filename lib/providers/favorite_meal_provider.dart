import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleFavoriteMeal(Meal selectedMeal) {
    if (state.contains(selectedMeal)) {
      state = state.where((meal) => meal.id != selectedMeal.id).toList();
      return false;
    } else {
      state = [...state, selectedMeal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
