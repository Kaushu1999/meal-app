import 'package:flutter/material.dart';
import "./Screens/filter_screen/filter_screen.dart";
import "./dummy_data.dart";
import "./modals/meal.dart";
import "Screens/categories_meal_screen/categories_meal_screen.dart";
import "./Screens/meal_details_screen/meal_details_screen.dart";
import "Screens/landing_app_screen/landing_screen.dart";
import "./Screens/tabs_screen/tab_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> favoritesMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        favoritesMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoritesMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isfavorite(String id) {
    return favoritesMeals.any((meal) => meal.id == id);
  }

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
                fontWeight: FontWeight.w700)),
        // primarySwatch: Color.fromRGBO(5, 63, 93, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(5, 63, 93, 1),
          secondary: const Color(0xFFFFC107),
        ),
      ),
      // home: const MyHomePage(),
      routes: {
        "/": (context) => const LandingScreen(),
        TabScreen.routeName: (context) => TabScreen(favoritesMeals),
        CategoriesMealsScreen.routeName: (context) =>
            CategoriesMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_isfavorite, _toggleFavorite),
        FilterScreen.routeName: (context) => FilterScreen(_filters, setFilters)
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) =>
              CategoriesMealsScreen(availableMeals: _availableMeals)),
    );
  }
}
