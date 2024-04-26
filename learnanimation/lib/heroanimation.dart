import 'package:flutter/material.dart';

class heroCopy extends StatelessWidget {
  const heroCopy({super.key});

  @override
  Widget build(BuildContext context) {
    final itemshero = HeroItems();
    return Scaffold(
      body: ListView.builder(
        itemCount: itemshero.items.length,
        itemBuilder: (context, index) {
          final newitem = itemshero.items[index];
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HeroDetails(items: newitem);
                },
              ));
            },
            title: Text(newitem.title),
            subtitle: Text(newitem.subtitle),
            leading: Hero(
                tag: itemshero.items[index].image,
                child: CircleAvatar(
                  backgroundImage: AssetImage(newitem.image),
                )),
          );
        },
      ),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = HeroItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero"),
      ),
      body: ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroDetails(items: item),
                ),
              );
            },
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            leading: Hero(
              tag: controller.items[index].image,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(item.image),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Det extends StatelessWidget {
  const Det({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(),
    ));
  }
}

class HeroDetails extends StatelessWidget {
  final HeroInfo items;
  const HeroDetails({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
      ),
      body: Center(
        child: Hero(
          tag: items.image,
          child: CircleAvatar(radius: 200, child: Image.asset(items.image)),
          // transitionOnUserGestures: true,
          flightShuttleBuilder: (BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext) {
            final Widget toHero = toHeroContext.widget;
            return RotationTransition(
              turns: animation,
              child: toHero,
            );
          },
          placeholderBuilder: (BuildContext context, Size size, Widget child) {
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Text(""),
            );
          },
        ),
      ),
    );
  }
}

class HeroInfo {
  final String title;
  final String subtitle;
  final String image;

  HeroInfo({required this.title, required this.subtitle, required this.image});
}

class HeroItems {
  List<HeroInfo> items = [
    HeroInfo(
        title: "Sathixh",
        subtitle: "sqathixh@gmail.com",
        image: "assets/image2.png"),
    HeroInfo(
        title: "Srhtrji",
        subtitle: "sqathixh@gmail.com",
        image: "assets/image1.png"),
  ];
}




