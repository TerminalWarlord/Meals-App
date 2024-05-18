import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleFavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showSnackbarAlert("${meal.title} has been removed to your favorites!");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showSnackbarAlert("${meal.title} has been added to your favorites!");
      });
    }
  }

  void _showSnackbarAlert(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
    ));
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectMenu(String identifier) {
    if (identifier == 'meals') {
      Navigator.pop(context);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavorite: _toggleFavorite,
    );

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? "Catagories" : "Favorites"),
      ),
      drawer: MainDrawer(onSelectMenu: _selectMenu),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
