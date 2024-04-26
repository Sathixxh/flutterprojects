import 'package:flutter/material.dart';

class CardPlanetData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  CardPlanetData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class CardPlanet extends StatelessWidget {
  const CardPlanet({
    required this.data,
    Key? key,
  }) : super(key: key);

  final CardPlanetData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              SizedBox(
                height: 200,
              ),
              Image(
                image: data.image,
                height: 100,
              ),
              const Spacer(flex: 1),
              Text(
                data.title.toUpperCase(),
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Center(
                child: Text(
                  data.subtitle,
                  style: TextStyle(
                    color: data.subtitleColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              const Spacer(flex: 3),
              Icon(Icons.navigate_next),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ],
    );
  }
}
