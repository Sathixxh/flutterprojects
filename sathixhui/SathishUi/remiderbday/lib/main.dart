import 'package:flutter/material.dart';
import 'package:sathishui/addbday.dart';
import 'package:sathishui/bdaylist.dart';
import 'package:sathishui/mainscreen.dart';
import 'package:sathishui/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      // home: InstructionPage()
      // home: AddBirthdayScreen()
      home: Welcomepage(),
      // home: BottomNavigationScreen()
      // home:AddBirthday()
      // home: Home(),
      // home: AllBirthdaysScreen(),
    );
  }
}

class CustomBlobBlue extends StatefulWidget {
  @override
  State<CustomBlobBlue> createState() => _CustomBlobBlueState();
}

class _CustomBlobBlueState extends State<CustomBlobBlue> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  top: 80,
                  left: 30,
                  child: Image.asset(
                    "assets/images/Online wishes-rafiki.png",
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.width * 0.80,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(167, 190, 242, 0.5)
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
