import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  const FilterSwitch(
      {super.key,
      required this.currentBtnSubtitle,
      required this.currentBtnTitle,
      required this.currentBtnValue,
      required this.onToggleBtn,
      required this.identifier});

  final bool currentBtnValue;
  final String currentBtnTitle;
  final String identifier;
  final String currentBtnSubtitle;
  final void Function(bool isChecked, String identifier) onToggleBtn;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: currentBtnValue,
      onChanged: (isChecked) {
        onToggleBtn(isChecked, identifier);
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
