import 'package:flutter/material.dart';
import "../.././dummy_data.dart";
import "../tabs_screen/tab_screen.dart";

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late List mealdata;
  @override
  void initState() {
    mealdata = DUMMY_MEALS;
    // TODO: implement initState
    super.initState();
  }

  void showTabScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          showTabScreen(context);
        },
        child: Stack(
          children: [
            GridView(
              // padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              children: [
                ...mealdata
                    .map((catData) => Container(
                          width: 300,
                          height: 150,
                          child: Image.network(catData.imageUrl,
                              fit: BoxFit.cover),
                        ))
                    .toList()
              ],
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, .50)),
            ),
            Center(
              child: Container(
                height: 300,
                // color: Colors.amber,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              width: 200,
                              height: 45,
                              decoration: const BoxDecoration(
                                // color: Color.fromARGB(255, 253, 218, 111),
                                color: const Color.fromRGBO(5, 63, 93, 1),

                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                // border: Border.all(width: 0), // 0.1 to
                              ),
                              child: const Center(
                                child: Text(
                                  "MEALS APP",
                                  style: TextStyle(
                                    fontFamily: "Raleway",
                                    fontSize: 20,
                                    // fontWeight: FontWeight.w700,
                                    // color: const Color.fromRGBO(5, 63, 93, 1),
                                    color: Color.fromARGB(255, 253, 218, 111),

                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 5),
                              width: 250,
                              height: 28,
                              decoration: BoxDecoration(
                                // color: const Color.fromARGB(255, 253, 218, 111),
                                color: const Color.fromRGBO(5, 63, 93, 1),

                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "So what are you going to cook today?",
                                  style: TextStyle(
                                    fontFamily: "RobotoCondensed",
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                    // color: Color.fromRGBO(5, 63, 93, 1),
                                    color: Color.fromARGB(255, 253, 218, 111),

                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: const FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            'Tap anywhere to continue!',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
