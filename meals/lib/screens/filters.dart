import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFreeFilterSet;
  late bool _lactoseFreeFilterSet;
  late bool _vegetarianFilterSet;
  late bool _veganFilterSet;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  Widget _buildSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          // Send the chosen filters back to whoever opened this screen.
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            _buildSwitch(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              value: _glutenFreeFilterSet,
              onChanged: (v) => setState(() => _glutenFreeFilterSet = v),
            ),
            _buildSwitch(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals.',
              value: _lactoseFreeFilterSet,
              onChanged: (v) => setState(() => _lactoseFreeFilterSet = v),
            ),
            _buildSwitch(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              value: _vegetarianFilterSet,
              onChanged: (v) => setState(() => _vegetarianFilterSet = v),
            ),
            _buildSwitch(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: _veganFilterSet,
              onChanged: (v) => setState(() => _veganFilterSet = v),
            ),
          ],
        ),
      ),
    );
  }
}