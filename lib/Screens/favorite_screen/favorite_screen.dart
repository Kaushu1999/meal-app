import 'package:flutter/material.dart';
import '../../modals/meal.dart';
import "../../widget/meal_item.dart";

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  const FavoritesScreen({required this.favoritesMeals, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Center(
        child: Text("You have no favorites Yet- Start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            affordability: favoritesMeals[index].affordability,
            complexity: favoritesMeals[index].complexity,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
