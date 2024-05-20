import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/switches.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.filters});

  final Map<Filter, bool> filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGluFree = false;
  bool _isLactose = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    super.initState();
    _isGluFree = widget.filters[Filter.glutenFree]!;
    _isLactose = widget.filters[Filter.lactoseFree]!;
    _isVegetarian = widget.filters[Filter.vegetarian]!;
    _isVegan = widget.filters[Filter.vegan]!;
  }

  void _toggleSwitch(bool isChecked, String identifier) {
    if (identifier == 'gluten') {
      setState(() {
        _isGluFree = isChecked;
      });
    } else if (identifier == 'lactose') {
      setState(() {
        _isLactose = isChecked;
      });
    } else if (identifier == 'vegetarian') {
      setState(() {
        _isVegetarian = isChecked;
      });
    } else {
      setState(() {
        _isVegan = isChecked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: MainDrawer(onSelectMenu: (identifier) {
        Navigator.pop(context);
        if (identifier == 'meals') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const TabsScreen(),
            ),
          );
        }
      }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _isGluFree,
            Filter.lactoseFree: _isLactose,
            Filter.vegetarian: _isVegetarian,
            Filter.vegan: _isVegan,
          });
          return false;
        },
        child: Column(
          children: [
            FilterSwitch(
              currentBtnSubtitle: 'Includes gluten-free meals',
              currentBtnTitle: "Gluten-free",
              currentBtnValue: _isGluFree,
              onToggleBtn: _toggleSwitch,
              identifier: 'gluten',
            ),
            FilterSwitch(
              currentBtnSubtitle: 'Includes lactose-free meals',
              currentBtnTitle: "Lactose-free",
              currentBtnValue: _isLactose,
              onToggleBtn: _toggleSwitch,
              identifier: 'lactose',
            ),
            FilterSwitch(
              currentBtnSubtitle: 'Includes vegetarian meals',
              currentBtnTitle: "Vegetarian",
              currentBtnValue: _isVegetarian,
              onToggleBtn: _toggleSwitch,
              identifier: 'vegetarian',
            ),
            FilterSwitch(
              currentBtnSubtitle: 'Includes vegan meals',
              currentBtnTitle: "Vegan",
              currentBtnValue: _isVegan,
              onToggleBtn: _toggleSwitch,
              identifier: 'vegan',
            ),
          ],
        ),
      ),
    );
  }
}
