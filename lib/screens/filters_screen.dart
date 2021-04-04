import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    super.initState();
    var filters = widget.filters;
    _glutenFree = filters['gluten'];
    _vegetarian = filters['vegetarian'];
    _vegan = filters['vegan'];
    _lactoseFree = filters['lactose'];
  }

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildListTile(String text, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(text),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile('Gluten-free', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildListTile('Vegetarian', _vegetarian, (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildListTile('Vegan', _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buildListTile('Lactose-free', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
