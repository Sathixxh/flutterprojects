import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Push Notifications")),
      body: Column(
        children: [
          Center(
            child: Text(
              "Notifications by using Firebase",
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("done"))
        ],
      ),
    );
  }
}
