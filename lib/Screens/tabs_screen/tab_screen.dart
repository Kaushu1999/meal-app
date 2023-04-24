import "package:flutter/material.dart";
import "../categories_screen/categories_screen.dart";
import "../../widget/main_drawer.dart";
import "../../modals/meal.dart";
import "../favorite_screen/favorite_screen.dart";

class TabScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;
  static const routeName = "/TabScreen";
  const TabScreen(this.favoritesMeals, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {"page": const CategoriesScreen(), "title": "Categories"},
      {
        "page": FavoritesScreen(favoritesMeals: widget.favoritesMeals),
        "title": "Your Favorite"
      },
    ];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     initialIndex: 0,
    //     child:
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"] as String),

        // *******this is our top tapbar of under appbar  ******
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: "Categories",
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: "Favorites",
        //     )
        //   ],
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]["page"] as Widget,

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.category,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(
              Icons.star,
            ),
            label: "favorite",
          ),
        ],
      ),
      // const TabBarView(
      //   children: [CategoriesScreen(), FovoriteScreen()],
      // ),
    );
  }
}
