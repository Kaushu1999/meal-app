import "package:flutter/material.dart";

class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(String text, IconData icon, tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      onTap: tapHandler,
    );
  }

  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Text(
                    "Cooking Up!",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                listTileBuilder(
                    "Meals",
                    Icons.restaurant,
                    () => {
                          Navigator.of(context)
                              .pushReplacementNamed("/TabScreen")
                        }),
                listTileBuilder("Filters", Icons.settings, () {
                  Navigator.of(context).pushReplacementNamed("/filter");
                }),
                listTileBuilder("Help and Support", Icons.help_center, () {}),
                listTileBuilder("Language", Icons.language, () {}),
                listTileBuilder("Services", Icons.support, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
