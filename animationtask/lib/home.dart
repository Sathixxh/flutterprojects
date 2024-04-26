

// import 'package:animationtask/gerodet.dart';

// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = HeroItems();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hero"),
//       ),
//       body: ListView.builder(
//         itemCount: controller.items.length,
//         itemBuilder: (context, index) {
//           final item = controller.items[index];
//           return ListTile(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HeroDetails(items: item),
//                 ),
//               );
//             },
//             title: Text(item.title),
//             subtitle: Text(item.subtitle),
//             leading: Hero(
//            tag: controller.items[index].image,
//               child: CircleAvatar(
//                 radius: 30,
//                 backgroundImage: AssetImage(item.image),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// class HeroDetails extends StatelessWidget {
//   final HeroInfo items;
//   const HeroDetails({super.key,required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(items.title),
//       ),

//       body: Center(
//         child: Hero(
          
//           transitionOnUserGestures: true,
//             tag: items.image,
//             child: Image.asset(items.image)),
//       ),
//     );
//   }
// }

//  class HeroInfo{
//   final String title;
//   final String subtitle;
//   final String image;

//   HeroInfo({required this.title, required this.subtitle, required this.image});
//  }

//  class HeroItems{
//   List<HeroInfo> items =[
//     HeroInfo(title: "Sathixh", subtitle: "sqathixh@gmail.com", image: "assets/image1.png"),
 
//   ];
//  }


import 'package:flutter/material.dart';

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
          child: Image.asset(items.image),
          transitionOnUserGestures: true,
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
              child: CircularProgressIndicator(),
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
        image: "assets/image1.png"),
  ];
}
