import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            alignment: Alignment.center,
            child: Text(
              'What\'s Cooking!!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
              ),
            ),
          ),
          buildNavDrawerItem(
            context,
            Icons.restaurant,
            'Meals',
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildNavDrawerItem(
            context,
            Icons.settings,
            'Filter',
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }

  ListTile buildNavDrawerItem(BuildContext context, IconData icon, String title,
      VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 30,
            ),
      ),
      onTap: tapHandler,
    );
  }
}
