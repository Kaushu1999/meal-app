import "package:flutter/material.dart";
import "../../dummy_data.dart";

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/Meal-details";
  final Function _toggleFavorite;
  final Function _isfavorite;

  const MealDetailScreen(this._isfavorite, this._toggleFavorite, {super.key});

  Widget builderSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget builderContainerView(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: 350,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    // final isLandscape =
    //     MediaQuery.of(context).orientation == Orientation.landscape;

    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    print(_isfavorite(mealId));

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        selectedMeal.title,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            builderSectionTitle(context, "Ingredients"),
            builderContainerView(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            builderSectionTitle(context, "Steps"),
            builderContainerView(
              ListView.builder(
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("# ${(index + 1)}"),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                        ],
                      ),
                  itemCount: selectedMeal.steps.length),
            ),
            const Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isfavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          _toggleFavorite(mealId);
        },
      ),
    );
  }
}
