import "package:flutter/material.dart";
import "package:meal_app/modals/categories.dart";

class CategoriesMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // const CategoriesMealsScreen(
  //     {required this.categoryId, required this.categoryTitle, super.key});

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArg["title"] as String;
    final categoryId = routeArg["id"] as String;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // scaffoldBackgroundColor
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: Text(
          "The Recipe for the Categories !",
          // style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
