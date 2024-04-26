import 'package:flutter/material.dart';

import 'package:sathishui/main.dart';
import 'package:sathishui/mainscreen.dart';

class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  int currentSet = 0;

  List<List<Map<String, dynamic>>> instructionSets = [
    [
      {
        "text": "Get Started!",
        "subtext":
            "Simply add birthdays and let us handle the rest. We'll make sure you never miss a friend's special day.",
        "image": "assets/images/Blowing out Birthday candles-rafiki.png"
      },
      {
        "text": "Reminders Await!",
        "subtext":
            "Add birthdays effortlessly, and watch as we handle the rest. No more worrying about missing those important moments.",
        "image": "assets/images/Gifts-rafiki.png"
      },
      {
        "text": "Unlock Your Celebration Potential!",
        "subtext":
            "Adding birthdays is the key. Unlock the full potential of celebrations, and let us be your guide to memorable moments.",
        "image": "assets/images/Happy birthday-rafiki.png"
      },
    ],
  ];

  int currentInstructionIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentInstruction =
        instructionSets[currentSet][currentInstructionIndex];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back_ios),
                  ),
              
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Stack(
                  children: [
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Center(
                          child: CustomPaint(
                            size: Size(300, 300),
                            painter: BlobPainter(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 30,
                      child: Image.asset(
                        '${currentInstruction["image"]}',
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width * 0.80,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '${currentInstruction["text"]}',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Text(
                  '${currentInstruction["subtext"]}',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              FloatingActionButton(
                elevation: 0.0,
                backgroundColor: const Color.fromRGBO(234, 237, 249, 1),
                shape: const StarBorder.polygon(sides: 4.0, pointRounding: 0.5),
                onPressed: () {
                  if (currentInstructionIndex <
                      instructionSets[currentSet].length - 1) {
                    setState(() {
                      currentInstructionIndex++;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen()),
                    );
                  }
                },
                child: const Icon(Icons.keyboard_double_arrow_right_rounded,
                    color: Color.fromRGBO(80, 118, 252, 1)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
              const Text(
                'Next',
                style: TextStyle(fontSize: 17.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
