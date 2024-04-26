import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EduExpansion extends StatefulWidget {
  @override
  State<EduExpansion> createState() => _EduExpansionState();
}

class _EduExpansionState extends State<EduExpansion>
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: ListView(
          children: [
            Container(
              height: 50.0,
              child: Card(
                  color: Color(0xFF0043D0),
                  child: Center(
                      child: Text(
                    "My Journey",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Popins",
                        color: Colors.white),
                  ))),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: Matrix4.translationValues(
                    _animation.value * MediaQuery.of(context).size.width,
                    0.0,
                    0.0,
                  ),
                  child: Card(
                    elevation: 3,
                    shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      shape: Border.all(style: BorderStyle.none),
                      title: const Text(
                        'Current Experiences ',
                        style: TextStyle(
                            color: Color(0xFF0043D0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: const CircleBorder(),
                                      child: SizedBox(
                                        width: 120.0,
                                        height: 120.0,
                                        child: Image.asset(
                                          "assets/gif/flattradeAppLogo-removebg-preview.png",
                                          fit: BoxFit.contain,
                                          // Adjust this property based on your image aspect ratio
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Container(
                                        child: Card(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("FLUTTER DEVELOPER"),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/gif/building-unscreen.gif",
                                                    height: 30,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Flexible(
                                                    child: Text(
                                                      'FLATTRADE (Full-time,Software Engineer)Aug 2023 - Present',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/gif/location-unscreen.gif",
                                                    height: 30,
                                                  ),
                                                  // Icon(Icons.location_on),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    'Chennai, Tamil Nadu, India\n(On-site)',
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                    -_animation.value * MediaQuery.of(context).size.width,
                    0.0,
                    0.0,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: ExpansionTile(
                      shape: Border.all(style: BorderStyle.none),
                      title: const Text(
                        'Carrer Tranction ',
                        style: TextStyle(
                            color: Color(0xFF0043D0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: const CircleBorder(),
                                      child: SizedBox(
                                        width: 120.0,
                                        height: 120.0,
                                        child: Image.asset(
                                          "assets/gif/ospd-removebg-preview.png",
                                          fit: BoxFit.contain,
                                          height:
                                              30, // Adjust this property based on your image aspect ratio
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(" "),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/gif/building-unscreen.gif",
                                                height: 30,
                                              ),
                                              SizedBox(width: 8),
                                              Flexible(
                                                child: Text(
                                                    'Qspiders software development institute(Feb 2023 - Aug 2023)'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/gif/location-unscreen.gif",
                                                height: 30,
                                              ),
                                              SizedBox(width: 8),
                                              Flexible(
                                                child: Text(
                                                  'Vadapalani,Chennai,Tamil Nadu,\nIndia(On-site)',
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                    _animation.value * MediaQuery.of(context).size.width,
                    0.0,
                    0.0,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: ExpansionTile(
                      shape: Border.all(style: BorderStyle.none),
                      title: const Text(
                        'Previous Experiences ',
                        style: TextStyle(
                            color: Color(0xFF0043D0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: const CircleBorder(),
                                      child: SizedBox(
                                        width: 120.0,
                                        height: 120.0,
                                        child: Image.asset(
                                          "assets/gif/zf_logo-removebg-preview.png",
                                          fit: BoxFit.contain,
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(" "),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/gif/building-unscreen.gif",
                                                height: 30,
                                              ),
                                              SizedBox(width: 8),
                                              Flexible(
                                                child: Text(
                                                    'ZF Group Graduate Trainee,Quality inspection(Jan 2022-Jan 2023)'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/gif/location-unscreen.gif",
                                                height: 30,
                                              ),
                                              SizedBox(width: 8),
                                              Flexible(
                                                child: Text(
                                                    'Chengalpattu,chennai\nTamilNadu,(On-site)'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.translationValues(
                    -_animation.value * MediaQuery.of(context).size.width,
                    0.0,
                    0.0,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: ExpansionTile(
                      shape: Border.all(style: BorderStyle.none),
                      title: const Text(
                        'Education ',
                        style: TextStyle(
                            color: Color(0xFF0043D0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: Card(
                                      elevation: 4,
                                      color: Colors.white,
                                      shape: const CircleBorder(),
                                      child: SizedBox(
                                        width: 120.0,
                                        height: 120.0,
                                        child: Image.asset(
                                          "assets/gif/181-1818884_mount-zion-college-of-engineering-and-technology-mount-removebg-preview.png",
                                          fit: BoxFit.contain,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(" "),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/gif/building-unscreen.gif",
                                                height: 30,
                                              ),
                                              SizedBox(width: 8),
                                              Flexible(
                                                child: Text(
                                                    'Mount Zion College of Engineering and Technology\nBE, Mechanical Engineering(Jun 2018 - Aug 2021)'),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/gif/location-unscreen.gif",
                                                height: 30,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                  'Pudukkottai TamilNadu,\nIndia (On-site)'),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Image.asset("assets/gif/Hand coding-amico.png")
          ],
        ),
      ),
    );
  }
}
