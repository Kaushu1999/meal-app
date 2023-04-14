import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const CategoriesItem({this.id, this.title, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20)),
      child: Text(title),
    );
  }
}
