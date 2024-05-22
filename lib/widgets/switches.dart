import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterSwitch extends ConsumerWidget {
  const FilterSwitch(
      {super.key,
      required this.currentBtnSubtitle,
      required this.currentBtnTitle,
      required this.currentValue,
      required this.filter});

  final String currentBtnTitle;
  final bool currentValue;
  final Filter filter;
  final String currentBtnSubtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
      },
      title: Text(
        currentBtnTitle,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        currentBtnSubtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
