// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_scren.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal, {Key? key}) : super(key: key);

  void _selectMealItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: {'meal': meal},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMealItem(context),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 220,
                    color: Colors.black38,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  bottom: 20,
                  right: 10,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  infoItem(
                    Icons.schedule,
                    '${meal.duration.toString()} min',
                  ),
                  infoItem(
                    Icons.work,
                    meal.complexity.toString().substring(11),
                  ),
                  infoItem(
                    Icons.attach_money,
                    meal.affordability.toString().substring(14),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row infoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
