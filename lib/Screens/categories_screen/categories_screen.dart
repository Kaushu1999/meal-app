import 'package:flutter/material.dart';
import "../../widget/categories_item.dart";
import '../.././dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        ...DUMMY_CATEGORIES
            .map((catData) => CategoriesItem(
                id: catData.id, title: catData.title, color: catData.color))
            .toList()
      ],
    );
  }
}
