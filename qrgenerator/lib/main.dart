// // import 'package:flutter/material.dart';
// // import 'package:qr_flutter/qr_flutter.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   final String yourName = 'Diwan';
// //   final int yourAge = 24;
// //   final String yourProfession = 'Developer';
// //   final String timestamp = DateTime.now().toString();

// //   String get details => '$yourName, Age:$yourAge, $yourProfession\n$timestamp';

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'QR Code Generator',
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('My QR Code'),
// //         ),
// //         body: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text('Your Details:'),
// //               Text(details),
// //               SizedBox(height: 20),
// //               QrCodeWidget(data: details),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class QrCodeWidget extends StatelessWidget {
// //   final String data;

// //   const QrCodeWidget({Key? key, required this.data}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return QrImageView(
// //       data:
// //           "https://firebasestorage.googleapis.com/v0/b/fir-firebase-8988c.appspot.com/o/SathixhProfileA.zip?alt=media&token=312fde0f-aea4-4b59-99f7-ac3770d98df3",
// //       version: QrVersions.auto,
// //       size: 400.0,
// //     );
// //   }
// // }

// import 'package:accordion/accordion.dart';
// import 'package:accordion/controllers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() async {
//   runApp(const AccordionApp());
// }

// class AccordionApp extends StatelessWidget {
//   const AccordionApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const AccordionPage(),
//     );
//   }
// }

// class AccordionPage extends StatelessWidget
// {
//   static const headerStyle = TextStyle(
//       color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
//   static const contentStyleHeader = TextStyle(
//       color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
//   static const contentStyle = TextStyle(
//       color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
//   static const loremIpsum =
//       '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

//   const AccordionPage({super.key});

//   @override
//   build(context) => Scaffold(
//         backgroundColor: Colors.blueGrey[100],
//         appBar: AppBar(
//           title: const Text('Accordion'),
//         ),
//         body: Accordion(
//           headerBorderColor: Colors.blueGrey,
//           headerBorderColorOpened: Colors.transparent,
//           // headerBorderWidth: 1,
//           headerBackgroundColorOpened: Colors.green,
//           contentBackgroundColor: Colors.white,
//           contentBorderColor: Colors.green,
//           contentBorderWidth: 3,
//           contentHorizontalPadding: 20,
//           scaleWhenAnimating: true,
//           openAndCloseAnimation: true,
//           headerPadding:
//               const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
//           sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
//           sectionClosingHapticFeedback: SectionHapticFeedback.light,
//           children: [
//             AccordionSection(
//               isOpen: true,
//               contentVerticalPadding: 20,
//               leftIcon:
//                   const Icon(Icons.text_fields_rounded, color: Colors.white),
//               header: const Text('Simple Text', style: headerStyle),
//               content: const Text(loremIpsum, style: contentStyle),
//             ),

//           ],
//         ),
//       );
// }

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final con = FlipCardController();
  final con1 = FlipCardController();
  final cong = GestureFlipCardController();
  final cong1 = GestureFlipCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlipCards"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            GestureFlipCard(
              controller: cong1,
              axis: FlipAxis.vertical,
              enableController: true,
              animationDuration: const Duration(seconds: 3),
              frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/images/instagram.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              backWidget: Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'assets/images/instagram.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Flip Bottom'),
              onPressed: () {
                // Flip the card programmatically

                cong.flipcard();
                cong1.flipcard();
              },
            ),
            GestureFlipCard(
              enableController: true,
              controller: cong,
              animationDuration: const Duration(milliseconds: 800),
              axis: FlipAxis.horizontal,
              frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/images/instagram.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              backWidget: Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'assets/images/instagram.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FlipCard(
              rotateSide: RotateSide.bottom,
              // onTapFlipping: false,
              axis: FlipAxis.horizontal,
              controller: con1,
              frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/images/instagram.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              backWidget: Container(
                width: 300,
                height: 200,
                child: Image.asset(
                  'assets/images/instagram.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Flip Bottom'),
              onPressed: () {
                // Flip the card programmatically
                con1.flipcard();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            FlipCard(
              rotateSide: RotateSide.right,
              disableSplashEffect: false,
              splashColor: Colors.orange,
              onTapFlipping: true,
              axis: FlipAxis.vertical,
              controller: con,
              frontWidget: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/images/instagram.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              backWidget: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset(
                    'assets/images/instagram.png',
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Flip Right'),
              onPressed: () {
                // Flip the card programmatically
                con.flipcard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
