import 'package:animationtask/herodata.dart';
import 'package:flutter/material.dart';


class HeroDetails extends StatelessWidget {
  final HeroInfo items;
  const HeroDetails({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
      ),

      body: Center(
        child: Hero(
          
          transitionOnUserGestures: true,
            tag: items.image,
            child: Image.asset(items.image)),
      ),
    );
  }
}