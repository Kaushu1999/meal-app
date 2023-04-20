import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegan = false;
  var vegetarian = false;
  var lactoseFree = false;

  Widget builderListSwitchtile(
      String title, String description, bool currentValue, swichSelector) {
    return SwitchListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
        subtitle:
            Text(description, style: Theme.of(context).textTheme.titleMedium),
        value: currentValue,
        onChanged: swichSelector);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters!"),
        ),
        drawer: const MainDrawer(),
        // body: const Text("filter"));
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "Adjust your meal section",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  builderListSwitchtile("Gluten-Free",
                      "Only include gluten-free meals", glutenFree, (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
                  builderListSwitchtile(
                      "Vegan", "Only include vegan meals", vegan, (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  }),
                  builderListSwitchtile(
                      "vegetarian", "Only include vegetarian meals", vegetarian,
                      (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  }),
                  builderListSwitchtile(
                      "lactoseFree",
                      "Only include lactose-Free meals",
                      lactoseFree,
                      (newValue) => {
                            setState(() {
                              lactoseFree = newValue;
                            })
                          }),
                ],
              ),
            ),
          ],
        ));
  }
}
