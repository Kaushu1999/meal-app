import "package:flutter/material.dart";
import "../categories_screen/categories_screen.dart";
import "../favorite-_screen//favorite_screen.dart";
import "../../widget/main_drawer.dart";

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = const [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FovoriteScreen(), "title": "Your Favorite"},
  ];

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
      drawer: MainDrawer(),
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
