import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";
  final Function _saveFilters;
  final Map<String, bool> currentFilter;

  const FilterScreen(this.currentFilter, this._saveFilters, {super.key});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegan = false;
  var vegetarian = false;
  var lactoseFree = false;

  @override
  void initState() {
    super.initState();
    // print("this is widget check ${widget.currentFilter["glutenFree"]}");
    glutenFree = widget.currentFilter["gluten"] as bool;
    vegan = widget.currentFilter["vegan"] as bool;
    vegetarian = widget.currentFilter["vegetarian"] as bool;
    lactoseFree = widget.currentFilter["lactose"] as bool;
  }

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
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "gluten": glutenFree,
                  "lactose": lactoseFree,
                  "vegan": vegan,
                  "vegetarian": vegetarian
                };
                print("on save click $selectedFilters");
                widget._saveFilters(selectedFilters);
              },
            ),
          ],
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

                    print("vegan selected $newValue");
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
