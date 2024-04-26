import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.55,
            child: const Image(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR65h493THAKZBI0GM8Wjdmt2C1rBir8Vg9zWAKqRA91Lblk7pw32KOOqehTzsnPN-mqTA&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Find your ',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Dream House ',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'we always ready to provide you the best rental',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
                const Text(
                  'house within effordable price',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                FloatingActionButton(
                  backgroundColor: const Color.fromRGBO(198, 207, 253, 1),
                  shape: const StarBorder.polygon(
                      sides: 4.0, pointRounding: 0.5),
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'skip',
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
