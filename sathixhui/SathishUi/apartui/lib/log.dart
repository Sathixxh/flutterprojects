import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView(
        children: [
            SizedBox(
              height: 100.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Text(
                  "We're glad to see you again",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}