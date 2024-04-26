import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sathixhprofile/infinitehome.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String aboutMeText = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
    _startTypingAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTypingAnimation() {
    String fullText =
        "Passionate and skilled Flutter developer  [9 Months] of experience in building cross-platform mobile applications. Proficient in Dart programming language and adept at utilizing Flutter framework to create visually appealing and highly functional user interfaces. Seeking to leverage expertise in Flutter development to contribute to innovative projects and deliver exceptional user experiences.";

    int index = 0;
    Timer.periodic(Duration(milliseconds: 20), (timer) {
      if (index < fullText.length) {
        setState(() {
          aboutMeText += fullText[index];
        });
        index++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
      child: ListView(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/gif/hi-unscreen.gif",
                width: 80.0,
                height: 80.0,
              ),
              Text(
                "\nThere! Im",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                  child: Text(
                    "SatheeshKumar M",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0043D0),
                    ),
                  ),
                ),
              );
            },
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Text(
                    "---FLUTTER DEVELOPER---",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 85, 85, 85),
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 - _animation.value,
                child: ClipOval(child: Image.asset("assets/gif/sathixh.jpg")),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Container(
              height: 250,
              width: 400,
              child: Text(
                aboutMeText,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
