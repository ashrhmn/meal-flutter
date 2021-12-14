import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "meal-detail-screen";

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['meal']?.title ?? ''),
      ),
      body: Container(
        child: Text(routeArgs['meal']?.title ?? 'Unknwon'),
      ),
    );
  }
}
