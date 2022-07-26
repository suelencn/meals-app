import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterPage extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  Map<String, bool> currentFilter;

  FilterPage(this.currentFilter, this.saveFilters);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactoseFree = widget.currentFilter['lactose']!;

    super.initState();
  }

  Widget _buildSwitchListTile(bool filter, String title, String description,
      Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: filter,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust yor meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  _glutenFree, 'Gluten-Free', 'Only include gluten-free meals.',
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile(_lactoseFree, 'Lactose-Free',
                  'Only include lactose-free meals.', (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  _vegetarian, 'Vegetarian', 'Only include vegetarian meals.',
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile(_vegan, 'Vegan', 'Only include vegan meals.',
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
