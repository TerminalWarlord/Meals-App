import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meal_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setAllFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool choosenPref) {
    state = {
      ...state,
      filter: choosenPref,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if ((activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) ||
        (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
        (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) ||
        (activeFilters[Filter.vegan]! && !meal.isVegan)) {
      return false;
    }
    return true;
  }).toList();
});
