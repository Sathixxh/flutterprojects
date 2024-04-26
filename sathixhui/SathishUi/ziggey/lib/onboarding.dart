import 'package:flutter/material.dart';
import 'package:onboardscreen/login.dart';
import 'package:onboardscreen/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: _pageController,
                itemCount: demoData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 232, 224),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        demoData[index]["illustration"],
                        height: 300,
                        width: 300,
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      demoData[index]["title"],
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        demoData[index]["text"],
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoData.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: MaterialStatePropertyAll(primaryColor),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    setState(() {
                      if (currentPage < demoData.length - 1) {
                        currentPage++;
                        _pageController.jumpToPage(currentPage);
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Login()));
                      }
                    });
                  },
                  child: Text(
                    currentPage == demoData.length - 1 ? "GET STARTED" : "NEXT",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/illustration/Order food-rafiki.svg",
    "title": "Welcome To Foodizes!",
    "text":
        "Order from the best local restaurants with easy, \non-demand delivery.",
  },
  {
    "illustration": "assets/illustration/Hamburger-bro.svg",
    "title": "Choose your food",
    "text":
        "Easily find your type of food craving and you’ll \nget delivery in a wide range.",
  },
  {
    "illustration": "assets/illustration/Take Away-pana.svg",
    "title": "Free delivery offers",
    "text":
        "Free delivery for new customers via Apple Pay and \nother payment methods.",
  },
];
