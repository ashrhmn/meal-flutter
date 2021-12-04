import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  // final String id;
  // final String title;

  // const CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(
      context,
    )?.settings.arguments as Map<String, String>;

    final String? title = routeArgs['title'];
    final String? id = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Unknown Category'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
