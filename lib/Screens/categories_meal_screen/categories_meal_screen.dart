import "package:flutter/material.dart";
import "../../dummy_data.dart";
import "../../widget/meal_item.dart";
import "../../modals/meal.dart";

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  const CategoriesMealsScreen({super.key});

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  late String categoryTitle;
  var _loder = false;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    if (!_loder) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArg["title"] as String;
      final categoryId = routeArg["id"] as String;
      displayedMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      _loder = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // scaffoldBackgroundColor
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              removeMeal: removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
