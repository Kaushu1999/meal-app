import 'package:flutter/material.dart';
import '../../categories_item.dart';
import '../.././dummy_data.dart';
import '../../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeals"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          ...DUMMY_CATEGORIES
              .map((catData) =>
                  CategoriesItem(title: catData.title, color: catData.color))
              .toList()
        ],
      ),
    );
  }
}