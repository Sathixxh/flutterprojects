import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sathixhprofile/c.dart';
import 'package:sathixhprofile/infinitehome.dart';

class VloggerContent extends StatefulWidget {
  @override
  State<VloggerContent> createState() => _VloggerContentState();
}

class _VloggerContentState extends State<VloggerContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  Widget _buildCategory(List<Map<String, dynamic>> categories) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var category in categories) _buildCategoryItem(category),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(Map<String, dynamic> category) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 - _animation.value,
                  child: Image.asset(
                    category["imagePath"],
                    height: 40.0,
                    width: 40.0,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 - _animation.value,
                  child: Text(
                    category["name"],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.0,
                  child: Card(
                      color: Color(0xFF0043D0),
                      child: Center(
                          child: Text(
                        "Soft Skills ",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Popins",
                            color: Colors.white),
                      ))),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 - _animation.value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Image.asset(
                            "assets/gif/Soft skills-bro.png",
                            height: 380,
                            width: 400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  height: 40.0,
                  child: Card(
                      color: Color(0xFF0043D0),
                      child: Center(
                          child: Text(
                        "Technical Skills",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Popins",
                            color: Colors.white),
                      ))),
                ),
                // _buildCategory(Categorise),
                // SizedBox(
                //   height: 30,
                // ),
                // _buildCategory(Categorise1),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  child: CurvedCarousel(
                    itemBuilder: (_, i) {
                      String name = Categorisennew[i]["name"];
                      String imagePath = Categorisennew[i]["imagePath"];

                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: 1.0 - _animation.value,
                                    child: Image.asset(
                                      imagePath,
                                      height: 40.0,
                                      width: 40.0,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10),
                              AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Transform.scale(
                                    scale: 1.0 - _animation.value,
                                    child: Text(
                                      name,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: Categorisennew.length,
                    horizontal: true,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 50.0,
                  child: Card(
                      color: Color(0xFF0043D0),
                      child: Center(
                          child: Text(
                        "UI-Templates ",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Popins",
                            color: Colors.white),
                      ))),
                ),
                SizedBox(
                  height: 30,
                ),

                Container(
                  child: HomeScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> Categorisennew = [
  {"name": "Html", "imagePath": "assets/gif/html-5.png"},
  {"name": "css", "imagePath": "assets/gif/icons8-css-logo-144.png"},
  {"name": "JavaScript", "imagePath": "assets/gif/java-script.png"},
  {"name": "Java", "imagePath": "assets/gif/java.png"},
  {
    "name": "Dart",
    "imagePath": "assets/gif/dart-programming-language-icon.png"
  },
  {"name": "Flutter", "imagePath": "assets/gif/icons8-flutter-48.png"},
  {
    "name": "FireBase",
    "imagePath":
        "assets/gif/kisspng-firebase-cloud-messaging-google-developers-softwar-5ae1d9fda49409.7709198715247508456741.png"
  },
  {"name": "Sql", "imagePath": "assets/gif/pngegg.png"},
];
