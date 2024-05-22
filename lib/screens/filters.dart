import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/switches.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allFilters = ref.watch(filtersProvider);

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
      body:
          // WillPopScope(
          //   onWillPop: () async {
          //     // go back (pop) without return to parent screen
          //     ref.read(filtersProvider.notifier).setAllFilters({
          //       Filter.glutenFree: _isGluFree,
          //       Filter.lactoseFree: _isLactose,
          //       Filter.vegetarian: _isVegetarian,
          //       Filter.vegan: _isVegan,
          //     });
          //     return true;

          //     // to return something with POP
          //     // Navigator.of(context).pop({
          //     //   Filter.glutenFree: _isGluFree,
          //     //   Filter.lactoseFree: _isLactose,
          //     //   Filter.vegetarian: _isVegetarian,
          //     //   Filter.vegan: _isVegan,
          //     // });
          //     // return false;
          //   },
          Column(
        children: [
          FilterSwitch(
            currentBtnSubtitle: 'Includes gluten-free meals',
            currentBtnTitle: "Gluten-free",
            filter: Filter.glutenFree,
            currentValue: allFilters[Filter.glutenFree]!,
          ),
          FilterSwitch(
            currentBtnSubtitle: 'Includes lactose-free meals',
            currentBtnTitle: "Lactose-free",
            filter: Filter.lactoseFree,
            currentValue: allFilters[Filter.lactoseFree]!,
          ),
          FilterSwitch(
            currentBtnSubtitle: 'Includes vegetarian meals',
            currentBtnTitle: "Vegetarian",
            filter: Filter.vegetarian,
            currentValue: allFilters[Filter.vegetarian]!,
          ),
          FilterSwitch(
            currentBtnSubtitle: 'Includes vegan meals',
            currentBtnTitle: "Vegan",
            filter: Filter.vegan,
            currentValue: allFilters[Filter.vegan]!,
          ),
        ],
      ),
    );
  }
}
