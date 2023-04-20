import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';
import "../../widget/main_drawer.dart";

class FilterScreen extends StatelessWidget {
  final routeName = "/filter";
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters!"),
      ),
      drawer: const MainDrawer(),
      body: const Center(child: Text("this is our Filter screens ")),
    );
  }
}
