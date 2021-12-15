import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "meal-detail-screen";

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    var appBar = AppBar(
      title: Text(meal.title),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: viewHeight(context, appBar) * 0.4,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: viewHeight(context, appBar) * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  listOfItem(context, meal.ingredients, 'Ingredients'),
                  listOfItem(context, meal.steps, 'Steps'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  double viewHeight(BuildContext context, AppBar appBar) {
    return (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        appBar.preferredSize.height);
  }

  Container listOfItem(BuildContext context, List<String> items, String title) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      child: Card(
        elevation: 5,
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...items.asMap().entries.map(
                          (ingredient) => Text(
                            indexedStr(ingredient),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String indexedStr(MapEntry<int, String> entry) =>
      '${(entry.key + 1).toString()}. ${entry.value}';
}
