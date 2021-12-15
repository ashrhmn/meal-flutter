import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  // const FiltersScreen({Key? key}) : super(key: key);

  static final String routeName = '/filters-screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            alignment: Alignment.center,
            child: Text('Adjust your meal filters...'),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  isGlutenFree,
                  'Gluten Free',
                  'Only include Gluten Free meals',
                  (newValue) {
                    setState(
                      () {
                        isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  isVegan,
                  'Vegan Free',
                  'Only include Vegan Free meals',
                  (newValue) {
                    setState(
                      () {
                        isVegan = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  isVegetarian,
                  'Vegetarian Free',
                  'Only include Vegetarian Free meals',
                  (newValue) {
                    setState(
                      () {
                        isVegetarian = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  isLactoseFree,
                  'Lactose Free',
                  'Only include Lactose Free meals',
                  (newValue) {
                    setState(
                      () {
                        isLactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      bool value, String title, String subtitle, Function updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.primary,
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: (newValue) => updateValue(newValue),
    );
  }
}
