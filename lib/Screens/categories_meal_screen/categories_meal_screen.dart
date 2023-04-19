import "package:flutter/material.dart";
import "../../dummy_data.dart";
import "../../widget/meal_item.dart";

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  const CategoriesMealsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArg["title"] as String;
    final categoryId = routeArg["id"] as String;
    final categoriesMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // scaffoldBackgroundColor
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoriesMeals[index].id,
              title: categoriesMeals[index].title,
              imageUrl: categoriesMeals[index].imageUrl,
              duration: categoriesMeals[index].duration,
              affordability: categoriesMeals[index].affordability,
              complexity: categoriesMeals[index].complexity,
            );
          },
          itemCount: categoriesMeals.length,
        ));
  }
}
