import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

import 'package:sathixhprofile/fabmenu.dart';

import 'package:sathixhprofile/widget/card.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardPlanetData(
      title: "Welcome Buddy!",
      subtitle:
          "Step into my world and discover the facets that shape my life from my interests and passions to my journey and experiences.",

      image: const AssetImage(
        "assets/gif/vlogger-unscreen.gif",
      ),
      backgroundColor: Color(0xFF0043D0),

      titleColor: Colors.white,
      subtitleColor: Colors.white,
      // background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardPlanetData(
      title: "Discover My  Profile",
      subtitle:
          "Explore my professional background, skills, and achievements. Learn about the projects I've worked on and the impact I've made in my field.",

      image: const AssetImage("assets/gif/social-media-1--unscreen.gif"),
      backgroundColor: Colors.white,
      titleColor: Color(0xFF0043D0),
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      // background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardPlanetData(
      title: "Let's Stay Connected!",
      subtitle:
          "Reach out to me directly, ask questions, or discuss investment ideas. I'm here to connect with you and share experiences.",

      image: const AssetImage("assets/gif/rocket-unscreen.gif"),
      backgroundColor: Color.fromARGB(255, 139, 115, 245),
      titleColor: Colors.white,
      subtitleColor: const Color.fromARGB(255, 0, 0, 0),
      // background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Fabmenu()),
          );
        },
      ),
    );
  }
}
