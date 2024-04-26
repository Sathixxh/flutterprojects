import 'package:flutter/material.dart';
import 'package:houseui/login.dart';

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
            "Let's get started! Find your dream home with SRI FLATS today.",
        "image": "assets/images/House searching-rafiki.png"
      },
      {
        "text": "Discover the Best Flats",
        "subtext":
            "Explore a wide range of flats and apartments to find the one that suits your lifestyle.",
        "image": "assets/images/Select house-rafiki.png"
      },
      {
        "text": "Simple Booking Process",
        "subtext":
            "Experience a hassle-free booking process with just a few taps.",
        "image": "assets/images/For sale-rafiki.png"
      },
    ],
  ];

  int currentInstructionIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentInstruction =
        instructionSets[currentSet][currentInstructionIndex];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      top: 60,
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
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                },
                child: const Icon(Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.indigo),
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

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 188, 187, 244)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 3, 0)
      ..quadraticBezierTo(size.width, 0, size.width, size.height / 5)
      ..quadraticBezierTo(size.width, size.height, size.width / 3, size.height)
      ..quadraticBezierTo(2, size.height, 10, size.height / 2)
      ..quadraticBezierTo(1, 0, size.width / 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
