import 'package:flutter/material.dart';
import "./Screens/filter_screen/filter_screen.dart";
import 'Screens/categories_screen/categories_screen.dart';
import "Screens/categories_meal_screen/categories_meal_screen.dart";
import "./Screens/meal_details_screen/meal_details_screen.dart";
import "./Screens/tabs_screen/tab_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),

        //***/ check for bg of scaffold
        // scaffoldBackgroundColor: Color.fromARGB(255, 182, 39, 39),

        canvasColor: const Color.fromRGBO(5, 63, 93, 1),

        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
            ),
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(22, 22, 22, 1),
            ),
            titleMedium: const TextStyle(
                fontSize: 18,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.normal),
            titleLarge: const TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold)),

        // primarySwatch: Color.fromRGBO(5, 63, 93, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(5, 63, 93, 1),
          secondary: const Color(0xFFFFC107),
        ),
      ),
      // home: const MyHomePage(),
      routes: {
        "/": (context) => const TabScreen(),
        CategoriesMealsScreen.routeName: (context) =>
            const CategoriesMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => const FilterScreen()
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => const CategoriesMealsScreen()),
    );
  }
}
