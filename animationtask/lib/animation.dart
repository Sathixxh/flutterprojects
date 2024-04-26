// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _visible = true;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Basic Animation'),
//         ),
//         body: Center(
//           child: AnimatedOpacity(
//             opacity: _visible ? 1.0 : 0.5,
//             duration: Duration(milliseconds: 500),
//             child: Container(
//               width: 200,
//               height: 200,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _visible = !_visible;
//             });
//           },
//           child: Icon(Icons.lightbulb_outline),
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/animation.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   double _width = 200.0;
// //   double _height = 200.0;
// //   Color _color = Colors.blue;

// //   bool isshow = true;
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Animated Container'),
// //         ),
// //         body: Center(
// //           child: AnimatedContainer(
// //             width: _width,
// //             height: _height,

// //             decoration: BoxDecoration(
// //                 color: _color,
// //                 borderRadius:isshow ? BorderRadius.all(Radius.circular(10.0)):BorderRadius.all(Radius.circular(60.0))),
// //             duration: Duration(milliseconds: 500),
// //             curve:
// //                 Curves.easeInOut, // Adjust animation curve for desired effect
// //           ),
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //             setState(() {
// //               isshow = !isshow;
// //               _width = _width == 200 ? 300 : 200;
// //               _height = _height == 200 ? 400 : 200;
// //               _color = _color == Colors.blue ? Colors.red : Colors.blue;
// //             });
// //           },
// //           child: Icon(Icons.play_arrow),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<Offset> _slideAnimation;

// //   bool _isPanelOpen = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
// //     _slideAnimation = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(-0.2, 0.1))
// //         .animate(_controller);
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Slide Transition'),
// //         ),
// //         body: Stack(
// //           children: [
// //             // Main content
// //             Center(child: Text('Main Content')),

// //             // Sliding panel
// //             SlideTransition(
// //               position: _slideAnimation,
// //               child: Container(
// //                 width: MediaQuery.of(context).size.width,
// //                 height: 200,
// //                 color: Colors.grey[300],
// //                 child: Center(child: Text('Sliding Panel')),
// //               ),
// //             ),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //             setState(() {
// //               _isPanelOpen = !_isPanelOpen;
// //               if (_isPanelOpen) {
// //                 _controller.forward();
// //               } else {
// //                 _controller.reverse();
// //               }
// //             });
// //           },
// //           child: Icon(Icons.menu),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: HomePage(),
// //     );
// //   }
// // }

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home Page'),
// //       ),
// //       body: Center(
// //         child: Hero(
// //           tag: 'imageHero', // Unique tag for the Hero widget
// //           child: Image.network(
// //             'https://cdn.pixabay.com/photo/2019/12/16/10/49/building-4699096_640.jpg', // Replace with your image URL
// //             width: 200,
// //             height: 200,
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => DetailsPage()),
// //           );
// //         },
// //         child: Icon(Icons.arrow_forward),
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';

// // class DetailsPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Details Page'),
// //       ),
// //       body: Center(
// //         child: Hero(
// //           tag: 'imageHero', // Same tag as the first screen's Hero
// //           child: Image.network(
// //             'https://cdn.pixabay.com/photo/2019/12/16/10/49/building-4699096_640.jpg', // Replace with your image URL (can be the same or different)
// //             width: 300,
// //             height: 300,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // home.dart
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Home Page'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Hero(
// //               tag: 'textHero',
// //               child: Text(
// //                 'This is some text',
// //                 style: TextStyle(fontSize: 24.0),
// //               ),
// //             ),
// //             SizedBox(height: 20.0),
// //             FloatingActionButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => DetailsPage()),
// //                 );
// //               },
// //               child: Icon(Icons.arrow_forward),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // details.dart
// // class DetailsPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Details Page'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Hero(
// //               tag: 'textHero',
// //               child: Text(
// //                 'This is the same text, but bigger!',
// //                 style: TextStyle(fontSize: 32.0),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:animationtask/home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';

// // void main() {
// //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
// //     // statusBarColor: Colors.transparent,
// //     // statusBarBrightness: Brightness.dark,
// //     // systemNavigationBarColor: Colors.transparent,
// //     // systemNavigationBarDividerColor: Colors.transparent,
// //     // systemNavigationBarIconBrightness: Brightness.dark,
// //     // statusBarIconBrightness: Brightness.dark,
// //   ));
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const Home(),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/animation.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _scaleAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
// //     _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(_controller);
// //     _controller.forward(); // Start animation on app launch
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Scale Animation'),
// //         ),
// //         body: Center(
// //           child: Transform.scale(
// //             scale: _scaleAnimation.value,
// //             child: GestureDetector(
// //               onTap: () {

// //               },
// //               child: Container(
// //                 width: 100,
// //                 height: 100,
// //                 color: Colors.blue,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'dart:math';

// // // import 'package:flutter/material.dart';

// // // void main() => runApp(MyApp());

// // // class MyApp extends StatefulWidget {
// // //   @override
// // //   _MyAppState createState() => _MyAppState();
// // // }

// // // class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
// // //   late AnimationController _controller;
// // //   late Animation<double> _rotationAnimation;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
// // //     _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
// // //     _controller.forward(); // Start animation on app launch
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _controller.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: Scaffold(
// // //         appBar: AppBar(
// // //           title: Text('Rotate Animation'),
// // //         ),
// // //         body: Center(
// // //           child: Transform.rotate(
// // //             angle: _rotationAnimation.value,
// // //             child: Container(
// // //               width: 100,
// // //               height: 100,
// // //               color: Colors.red,
// // //               child: Center(child: Text('Rotated Content')),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   bool _isButtonPressed = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Animated Button'),
// //       ),
// //       body: Center(
// //         child: GestureDetector(
// //           onTapDown: (_) {
// //             setState(() {
// //               _isButtonPressed = true;
// //             });
// //           },
// //           onTapUp: (_) {
// //             setState(() {
// //               _isButtonPressed = false;
// //             });
// //           },
// //           onTapCancel: () {
// //             setState(() {
// //               _isButtonPressed = false;
// //             });
// //           },
// //           child: AnimatedContainer(
// //             duration: Duration(milliseconds: 100),
// //             padding: EdgeInsets.symmetric(
// //               horizontal: 16,
// //               vertical: 10,
// //             ),
// //             decoration: BoxDecoration(
// //               color: _isButtonPressed ? const Color.fromARGB(255, 161, 85, 13) : Colors.blue,
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: Text(
// //               'Press Me',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 20,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Scale Animation Button'),
// //         ),
// //         body: Center(
// //           child: ScaleButton(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ScaleButton extends StatefulWidget {
// //   @override
// //   _ScaleButtonState createState() => _ScaleButtonState();
// // }

// // class _ScaleButtonState extends State<ScaleButton>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _animationController;
// //   late Animation<double> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController =
// //         AnimationController(vsync: this, duration: Duration(milliseconds: 100));
// //     _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_animationController)
// //       ..addListener(() {
// //         setState(() {});
// //       });
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         _animationController.forward().then((value) {
// //           _animationController.reverse();
// //         });
// //       },
// //       child: Transform.scale(
// //         scale: _animation.value,
// //         child: Container(
// //           width: 200,
// //           height: 50,
// //           decoration: BoxDecoration(
// //             color: Colors.blue,
// //             borderRadius: BorderRadius.circular(20),
// //           ),
// //           child: Center(
// //             child: Text(
// //               'Click Me',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 18,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Slide Animation Button'),
// //         ),
// //         body: Center(
// //           child: SlideButton(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SlideButton extends StatefulWidget {
// //   @override
// //   _SlideButtonState createState() => _SlideButtonState();
// // }

// // class _SlideButtonState extends State<SlideButton>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _animationController;
// //   late Animation<Offset> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController =
// //         AnimationController(vsync: this, duration: Duration(milliseconds: 500));
// //     _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, 0.1))
// //         .animate(CurvedAnimation(
// //             parent: _animationController, curve: Curves.easeInOutQuad));
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         _animationController.forward().then((value) {
// //           _animationController.reverse();
// //         });
// //       },
// //       child: SlideTransition(
// //         position: _animation,
// //         child: Container(
// //           width: 200,
// //           height: 50,
// //           decoration: BoxDecoration(
// //             color: Colors.blue,
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           child: Center(
// //             child: Text(
// //               'Add to Cart',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 18,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Horizontal Slide Animation Button'),
// //         ),
// //         body: Center(
// //           child: SlideButton(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SlideButton extends StatefulWidget {
// //   @override
// //   _SlideButtonState createState() => _SlideButtonState();
// // }

// // class _SlideButtonState extends State<SlideButton>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _animationController;
// //   late Animation<Offset> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController =
// //         AnimationController(vsync: this, duration: Duration(milliseconds: 500));
// //     _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.2, 0.0))
// //         .animate(CurvedAnimation(
// //             parent: _animationController, curve: Curves.easeInOut));
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         _animationController.forward().then((value) {
// //           _animationController.reverse();
// //         });
// //       },
// //       child: SlideTransition(
// //         position: _animation,
// //         child: Container(
// //           width: 200,
// //           height: 50,
// //           decoration: BoxDecoration(
// //             color: Colors.blue,
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           child: Center(
// //             child: Text(
// //               'Slide Right',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 18,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:slider_button/slider_button.dart';

// // // void main() => runApp(MyApp());

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(home: MainApp());
// // //   }
// // // }

// // // class MainApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Center(
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //           children: [
// // //             Center(
// // //                 child: SliderButton(
// // //               action: () async {
// // //                 ///Do something here
// // //                 return false;
// // //               },
// // //               label: Text(
// // //                 "Slide to cancel Event",
// // //                 style: TextStyle(
// // //                     color: Color(0xff4a4a4a),
// // //                     fontWeight: FontWeight.w500,
// // //                     fontSize: 17),
// // //               ),
// // //               icon: Center(
// // //                   child: Icon(
// // //                 CupertinoIcons.power,
// // //                 color: Colors.redAccent,
// // //                 size: 30.0,
// // //                 semanticLabel: 'Text to announce in accessibility modes',
// // //               )),
// // //               boxShadow: BoxShadow(
// // //                 color: Colors.black.withOpacity(0.3),
// // //                 blurRadius: 4,
// // //               ),
// // //             )),
// // //             SliderButton(
// // //               action: () async {
// // //                 ///Do something here OnSlide
// // //                 print("working");
// // //                 return false;
// // //               },

// // //               ///Put label over here
// // //               label: Text(
// // //                 "Slide to cancel !",
// // //                 style: TextStyle(
// // //                     color: Color(0xff4a4a4a),
// // //                     fontWeight: FontWeight.w500,
// // //                     fontSize: 17),
// // //               ),
// // //               icon: Center(
// // //                   child: Icon(
// // //                 CupertinoIcons.power,
// // //                 color: Colors.white,
// // //                 size: 40.0,
// // //                 semanticLabel: 'Text to announce in accessibility modes',
// // //               )),

// // //               //Put BoxShadow here
// // //               boxShadow: BoxShadow(
// // //                 color: Colors.black,
// // //                 blurRadius: 4,
// // //               ),

// // //               //Adjust effects such as shimmer and flag vibration here
// // //               shimmer: true,
// // //               vibrationFlag: true,

// // //               ///Change All the color and size from here.
// // //               width: 230,
// // //               radius: 10,
// // //               buttonColor: Color(0xffd60000),
// // //               backgroundColor: Color(0xff534bae),
// // //               highlightedColor: Colors.white,
// // //               baseColor: Colors.red,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:math';

// // // import 'package:action_slider/action_slider.dart';
// // import 'package:flutter/material.dart';

// // import 'ani.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Confirmation Slider Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Confirmation Slider Example'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   final _controller = ActionSliderController();

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[

// //             const SizedBox(height: 24.0),
// //             ActionSlider.standard(
// //               sliderBehavior: SliderBehavior.stretch,
// //               width: 300.0,
// //               backgroundColor: Colors.white,
// //               toggleColor: Colors.lightGreenAccent,
// //               action: (controller) async {
// //                 controller.loading(); //starts loading animation
// //                 await Future.delayed(const Duration(seconds: 3));
// //                 controller.success(); //starts success animation
// //                 await Future.delayed(const Duration(seconds: 1));
// //                 // controller.reset(); //resets the slider
// //               },
// //               child: const Text('Slide to confirm'),
// //             ),

// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // class AnimatedIconExample extends StatefulWidget {
// //   @override
// //   _AnimatedIconExampleState createState() => _AnimatedIconExampleState();
// // }

// // class _AnimatedIconExampleState extends State<AnimatedIconExample>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(seconds: 1), // Set the animation duration
// //     );
// //   }

// //   @override
// //   // void dispose() {
// //   //   _controller.dispose(); // Dispose the animation controller
// //   //   super.dispose();
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Animated Icon Example'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             AnimatedIcon(
// //               // Choose the desired animated icon
// //               icon: AnimatedIcons.home_menu,
// //               progress: _controller,
// //               size: 50, // Set the size of the icon
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_controller.isAnimating) {
// //                   _controller.stop(); // Stop the animation
// //                 } else {
// //                   _controller.repeat(); // Start the animation
// //                 }
// //               },
// //               child: Text(_controller.isAnimating ? 'Stop' : 'Play'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: AnimatedIconExample(),
// //   ));
// // }

// // //hi sir  iam saheehkumar iuam from

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Page Transition Animation',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: FirstPage(),
// //     );
// //   }
// // }

// // class FirstPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('First Page'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //                 context,
// //                 PageRouteBuilder(
// //                   transitionDuration: Duration(seconds: 2),
// //                   pageBuilder: (context, animation, secondaryAnimation) {
// //                     return SecondPage();
// //                   },
// //                   transitionsBuilder:
// //                       (context, animation, secondaryAnimation, child) {
// //                     return SlideTransition(
// //                       position: Tween<Offset>(
// //                               begin: Offset(1.0, 0.0), end: Offset.zero)
// //                           .animate(animation),
// //                       child: child,
// //                     );
// //                   },
// //                 )
// //                 // PageRouteBuilder(
// //                 //   transitionDuration: Duration(milliseconds: 500),
// //                 //   pageBuilder: (_, __, ___) => SecondPage(),
// //                 //   transitionsBuilder: (_, animation, __, child) {
// //                 //     return SlideTransition(
// //                 //       position: Tween<Offset>(
// //                 //         begin: Offset(1.0, 0.0),
// //                 //         end: Offset.zero,
// //                 //       ).animate(animation),
// //                 //       child: child,
// //                 //     );
// //                 //   },
// //                 // ),
// //                 );
// //           },
// //           child: Text('Go to Second Page'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class SecondPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Second Page'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           child: Text('Go back'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       home: FirstPage(),
// // //     );
// // //   }
// // // }

// // // class FirstPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('First Page'),
// // //       ),
// // //       body: Center(
// // //         child: ElevatedButton(
// // //           onPressed: () {
// // //             Navigator.of(context).push(
// // //               PageRouteBuilder(
// // //                 pageBuilder: (context, animation, secondaryAnimation) {
// // //                   return SecondPage();
// // //                 },
// // //                 transitionsBuilder: (context, animation, secondaryAnimation, child) {
// // //                   const curve = Curves.easeInOut;
// // //                   var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(
// // //                     CurveTween(curve: curve),
// // //                   );
// // //                   var offsetAnimation = animation.drive(tween);
// // //                   return SlideTransition(
// // //                     position: offsetAnimation,
// // //                     child: child,
// // //                   );
// // //                 },
// // //               ),
// // //             );
// // //           },
// // //           child: Text('Go to Second Page'),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class SecondPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.amber,
// // //       appBar: AppBar(
// // //         title: Text('Second Page'),
// // //       ),
// // //       body: Center(
// // //         child: ElevatedButton(
// // //           onPressed: () {
// // //             Navigator.of(context).pop();
// // //           },
// // //           child: Text('Go back'),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: AnimatedExample(),
// //     );
// //   }
// // }

// // class AnimatedExample extends StatefulWidget {
// //   @override
// //   _AnimatedExampleState createState() => _AnimatedExampleState();
// // }

// // class _AnimatedExampleState extends State<AnimatedExample> {
// //   bool _visible = false;
// //   bool _isExpanded = false;
// //   bool _isRotated = false;
// //   bool _isSlided = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Animation Examples'),
// //       ),
// //       body: ListView(
// //         children: [
// //           Column(
// //             // mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               AnimatedOpacity(
// //                 opacity: _visible ? 1.0 : 0.0,
// //                 duration: Duration(milliseconds: 500),
// //                 child: Container(
// //                   width: 100.0,
// //                   height: 100.0,
// //                   color: Colors.blue,
// //                 ),
// //               ),
// //               SizedBox(height: 20.0),
// //               AnimatedContainer(
// //                 duration: Duration(milliseconds: 500),
// //                 width: _isExpanded ? 100.0 : 70.0,
// //                 height: _isExpanded ? 100.0 : 70.0,
// //                 color: Colors.blue,
// //               ),
// //               SizedBox(height: 20.0),
// //               AnimatedContainer(
// //                 duration: Duration(milliseconds: 500),
// //                 transform: Matrix4.rotationX(_isRotated ? 0.9 : 0),
// //                 child: Container(
// //                   width: 100.0,
// //                   height: 100.0,
// //                   color: Colors.blue,
// //                 ),
// //               ),
// //               SizedBox(height: 20.0),
// //               AnimatedContainer(
// //                 duration: Duration(milliseconds: 500),
// //                 transform: Matrix4.translationValues(_isSlided ? 200.0 : 0.0, 0.0, 0.0),
// //                 child: Container(
// //                   width: 100.0,
// //                   height:100.0,
// //                   color: const Color.fromARGB(255, 12, 18, 22),
// //                 ),
// //               ),
// //               SizedBox(height: 20.0),
// //               TweenAnimationBuilder(
// //                 tween: Tween(begin: 0.0, end: 1.0),
// //                 duration: Duration(milliseconds: 500),
// //                 builder: (context, double value, child) {
// //                   return Opacity(
// //                     opacity: value,
// //                     child: Container(
// //                       width: 100.0,
// //                       height:100.0,
// //                       color: Colors.blue,
// //                     ),
// //                   );
// //                 },
// //               ),
// //               SizedBox(height: 20.0),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     _visible = !_visible;
// //                     _isExpanded = !_isExpanded;
// //                     _isRotated = !_isRotated;
// //                     _isSlided = !_isSlided;
// //                   });
// //                 },
// //                 child: Text('Toggle Animations'),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: CurvedAnimationExample(),
// //     );
// //   }
// // }

// // class CurvedAnimationExample extends StatefulWidget {
// //   @override
// //   _CurvedAnimationExampleState createState() => _CurvedAnimationExampleState();
// // }

// // class _CurvedAnimationExampleState extends State<CurvedAnimationExample> with SingleTickerProviderStateMixin {
// //    late AnimationController _controller;
// //    late Animation<double> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(seconds: 2),
// //     );

// //     _animation = CurvedAnimation(
// //       parent: _controller,
// //       curve: Curves.easeInOut,
// //     );

// //     _controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Curved Animation Example'),
// //       ),
// //       body: Center(
// //         child: ScaleTransition(
// //           scale: _animation,
// //           child: FlutterLogo(
// //             size: 200,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MaterialApp(
// //     home: LiquidSwipeAnimation(),
// //   ));
// // }

// // class LiquidSwipeAnimation extends StatefulWidget {
// //   @override
// //   _LiquidSwipeAnimationState createState() => _LiquidSwipeAnimationState();
// // }

// // class _LiquidSwipeAnimationState extends State<LiquidSwipeAnimation> with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //    late Animation<double> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 500),
// //     );

// //     _animation = _controller.drive(
// //       Tween<double>(
// //         begin: 0.0,
// //         end: 1.0,
// //       ),
// //     );

// //     _controller.addListener(() {
// //       setState(() {});
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// // void _handleDragUpdate(DragUpdateDetails details) {
// //   final width = context.size?.width ?? 0.0;
// //   _controller.value += details.primaryDelta! / width;
// // }

// //   void _handleDragEnd(DragEndDetails details) {
// //     if (_controller.isAnimating || _controller.status == AnimationStatus.completed) return;
// //     if (details.velocity.pixelsPerSecond.dx > 0.0) {
// //       _controller.forward();
// //     } else {
// //       _controller.reverse();
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Liquid Swipe Animation'),
// //       ),
// //       body: GestureDetector(
// //         onHorizontalDragUpdate: _handleDragUpdate,
// //         onHorizontalDragEnd: _handleDragEnd,
// //         child: Stack(
// //           children: [
// //             Container(
// //               width: double.infinity,
// //               height: double.infinity,
// //               color: Colors.blue.withOpacity(0.5),
// //             ),
// //             Positioned(
// //               left: _animation.value * (MediaQuery.of(context).size.width - 100),
// //               child: Container(
// //                 width: 100,
// //                 height: 100,
// //                 color: Colors.red,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     home: LoadingAnimation(),
// //   ));
// // }

// // class LoadingAnimation extends StatefulWidget {
// //   @override
// //   _LoadingAnimationState createState() => _LoadingAnimationState();
// // }

// // class _LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin {
// //  late AnimationController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(seconds: 1),
// //     )..repeat();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Loading Animation'),
// //       ),
// //       body: Center(
// //         child: RotationTransition(
// //           turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
// //           child: Container(
// //             width: 50,
// //             height: 50,
// //             decoration: BoxDecoration(
// //               shape: BoxShape.circle,
// //               // color: Colors.blue,
// //               border: Border.all(color: Colors.amber,width: 5)
// //             ),
// //             child: Text("."),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'dart:async';
// // // import 'dart:isolate';

// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Isolate Example',
// // //       home: MyHomePage(),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   @override
// // //   _MyHomePageState createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   int _result = 0;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // Start the heavy computation in a separate isolate
// // //     startIsolate();
// // //   }

// // //   void startIsolate() async {
// // //     ReceivePort receivePort = ReceivePort();
// // //     // Spawn a new isolate
// // //     await Isolate.spawn(_compute, receivePort.sendPort);

// // //     // Listen for messages from the isolate
// // //     receivePort.listen((message) {
// // //       setState(() {
// // //         _result = message;
// // //       });
// // //     });
// // //   }

// // //   static void _compute(SendPort sendPort) {
// // //     int result = 0;
// // //     // Perform heavy computation
// // //     for (int i = 0; i < 5; i++) {
// // //       print(result);
// // //       result += i;
// // //        print("rrrrrrrrrrrrrrr$result");
// // //     }
// // //     // Send the result back to the main isolate
// // //     sendPort.send(result);
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Isolate Example'),
// // //       ),
// // //       body: Center(
// // //         child: Text(
// // //           'Result: $_result',
// // //           style: TextStyle(fontSize: 24),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // import 'dart:async';
// // // import 'dart:isolate';
// // // import 'dart:typed_data';

// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Isolate Example',
// // //       home: MyHomePage(),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   @override
// // //   _MyHomePageState createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   Uint8List? _imageBytes;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // Start the image download in a separate isolate
// // //     startIsolate();
// // //   }

// // //   void startIsolate() async {
// // //     ReceivePort receivePort = ReceivePort();
// // //     // Spawn a new isolate
// // //     await Isolate.spawn(_downloadImage, receivePort.sendPort);

// // //     // Listen for messages from the isolate
// // //     receivePort.listen((message) {
// // //       if (message is Uint8List) {
// // //         setState(() {
// // //           _imageBytes = message;
// // //         });
// // //       }
// // //     });
// // //   }

// // //   static void _downloadImage(SendPort sendPort) async {
// // //     final url = 'https://via.placeholder.com/150';
// // //     // Perform the image download
// // //     final response = await http.get(Uri.parse(url));

// // //     if (response.statusCode == 200) {
// // //       // Send the image bytes back to the main isolate
// // //       sendPort.send(response.bodyBytes);
// // //     } else {
// // //       throw Exception('Failed to download image');
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Isolate Example'),
// // //       ),
// // //       body: Center(
// // //         child: _imageBytes != null
// // //             ? Image.memory(_imageBytes!)
// // //             : CircularProgressIndicator(),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';

// // void main() {
// //   runApp(Myapp());
// // }

// // class Myapp extends StatelessWidget {
// //   const Myapp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: DemoAnimation(),
// //     );
// //   }
// // }

// // class DemoAnimation extends StatefulWidget {
// //   const DemoAnimation({super.key});

// //   @override
// //   State<DemoAnimation> createState() => _DemoAnimationState();
// // }

// // class _DemoAnimationState extends State<DemoAnimation> {
// //   bool isClick = false;
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Center(
// //               child: GestureDetector(
// //             onTap: () {
// //               setState(() {
// //                 isClick = !isClick;
// //               });
// //             },
// //             child: AnimatedContainer(
// //                 height: isClick ? 90 : 60,
// //                 width: isClick ? 100 : 150,
// //                 decoration: BoxDecoration(
// //                     color: isClick ? Colors.green : Colors.blueAccent,
// //                     borderRadius: isClick
// //                         ? BorderRadius.circular(50.0)
// //                         : BorderRadius.all(Radius.circular(100))),
// //                 duration: Duration(milliseconds: 500),
// //                 child: isClick
// //                     ? Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           Icon(Icons.done,size: 50,),
// //                           Flexible(child: Text("Done")),
// //                         ],
// //                       )
// //                     : Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         children: [
// //                           Text("Add"),
// //                           Icon(Icons.add_shopping_cart_outlined),
// //                         ],
// //                       )),
// //           ))
// //         ],
// //       ),
// //     ));
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(),
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;

// //   late Animation _profilePictureAnimation;
// //   late Animation _contentAnimation;
// //   late Animation _listAnimation;
// //   late Animation _fabAnimation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller =
// //         AnimationController(vsync: this, duration: Duration(seconds: 5));
// //     _profilePictureAnimation = Tween(begin: 10.0, end: 50.0).animate(
// //         CurvedAnimation(
// //             parent: _controller,
// //             curve: Interval(0.0, 0.0, curve: Curves.easeOut)));
// //     _contentAnimation = Tween(begin: 20.0, end: 34.0).animate(CurvedAnimation(
// //         parent: _controller,
// //         curve: Interval(0.20, 0.40, curve: Curves.easeOut)));
// //     _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
// //         parent: _controller,
// //         curve: Interval(0.40, 0.75, curve: Curves.easeOut)));
// //     _fabAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
// //         parent: _controller,
// //         curve: Interval(0.75, 1.0, curve: Curves.easeOut)));
// //     _controller.repeat();
// //     _controller.addListener(() {
// //       setState(() {});
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         //  brightness: Brightness.light,
// //         backgroundColor: Colors.white,
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(Icons.supervised_user_circle),
// //             color: Colors.black,
// //             onPressed: () {},
// //             iconSize: _profilePictureAnimation.value,
// //           ),
// //         ],
// //         elevation: 0.0,
// //       ),
// //       body: _buildBody(),
// //       floatingActionButton: _buildFAB(),
// //     );
// //   }

// //   Widget _buildBody() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         Expanded(
// //           child: Container(
// //             padding: EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 SizedBox(
// //                   height: 16.0,
// //                 ),
// //                 Text(
// //                   "Good Morning",
// //                   style: TextStyle(
// //                       fontSize: _contentAnimation.value,
// //                       fontWeight: FontWeight.w600),
// //                 ),
// //                 SizedBox(
// //                   height: 18.0,
// //                 ),
// //                 Text(
// //                   "Here are your plans for today",
// //                   style: TextStyle(fontSize: 18.0),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //         Expanded(
// //           flex: 3,
// //           child: Opacity(
// //             opacity: _listAnimation.value,
// //             child: ListView.builder(
// //               itemBuilder: (context, position) {
// //                 return CheckboxListTile(
// //                   title: Text("This is item $position"),
// //                   value: true,
// //                   onChanged: (val) {},
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildFAB() {
// //     return Transform.scale(
// //       scale: _fabAnimation.value,
// //       child: FloatingActionButton(
// //         onPressed: () {},
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // // import 'dart:math';

// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({
// // //     Key? key,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const MaterialApp(
// // //       color: Colors.white,
// // //       home: CardHiddenAnimationPage(),
// // //     );
// // //   }
// // // }

// // // class CardHiddenAnimationPage extends StatefulWidget {
// // //   const CardHiddenAnimationPage({Key? key}) : super(key: key);

// // //   @override
// // //   State<CardHiddenAnimationPage> createState() =>
// // //       CardHiddenAnimationPageState();
// // // }

// // // class CardHiddenAnimationPageState extends State<CardHiddenAnimationPage>
// // //     with TickerProviderStateMixin {
// // //   final cardSize = 150.0;

// // //   late final holeSizeTween = Tween<double>(
// // //     begin: 0,
// // //     end: 1.5 * cardSize,
// // //   );
// // //   late final holeAnimationController = AnimationController(
// // //     vsync: this,
// // //     duration: const Duration(milliseconds: 300),
// // //   );
// // //   double get holeSize => holeSizeTween.evaluate(holeAnimationController);
// // //   late final cardOffsetAnimationController = AnimationController(
// // //     vsync: this,
// // //     duration: const Duration(milliseconds: 1000),
// // //   );

// // //   late final cardOffsetTween = Tween<double>(
// // //     begin: 0,
// // //     end: 2 * cardSize,
// // //   ).chain(CurveTween(curve: Curves.easeInBack));
// // //   late final cardRotationTween = Tween<double>(
// // //     begin: 0,
// // //     end: 2.0,
// // //   ).chain(CurveTween(curve: Curves.easeInBack));
// // //   late final cardElevationTween = Tween<double>(
// // //     begin: 2,
// // //     end: 20,
// // //   );

// // //   double get cardOffset =>
// // //       cardOffsetTween.evaluate(cardOffsetAnimationController);
// // //   double get cardRotation =>
// // //       cardRotationTween.evaluate(cardOffsetAnimationController);
// // //   double get cardElevation =>
// // //       cardElevationTween.evaluate(cardOffsetAnimationController);

// // //   @override
// // //   void initState() {
// // //     holeAnimationController.addListener(() => setState(() {}));
// // //     cardOffsetAnimationController.addListener(() => setState(() {}));
// // //     super.initState();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     holeAnimationController.dispose();
// // //     cardOffsetAnimationController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       floatingActionButton: Row(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           FloatingActionButton(
// // //             onPressed: () async {
// // //               holeAnimationController.forward();
// // //               await cardOffsetAnimationController.forward();
// // //               Future.delayed(const Duration(milliseconds: 200),
// // //                   () => holeAnimationController.reverse());
// // //             },
// // //             child: const Icon(Icons.remove),
// // //           ),
// // //           const SizedBox(width: 20),
// // //           FloatingActionButton(
// // //             onPressed: () {
// // //               cardOffsetAnimationController.reverse();
// // //               holeAnimationController.reverse();
// // //             },
// // //             child: const Icon(Icons.add),
// // //           ),
// // //         ],
// // //       ),
// // //       body: Center(
// // //         child: SizedBox(
// // //           height: cardSize * 1.25,
// // //           width: double.infinity,
// // //           child: ClipPath(
// // //             clipper: BlackHoleClipper(),
// // //             child: Stack(
// // //               alignment: Alignment.bottomCenter,
// // //               clipBehavior: Clip.none,
// // //               children: [
// // //                 SizedBox(
// // //                   width: holeSize,
// // //                   child: Image.asset(
// // //                     'assets/hole.png',
// // //                     fit: BoxFit.fill,
// // //                   ),
// // //                 ),
// // //                 Positioned(
// // //                   child: Center(
// // //                     child: Transform.translate(
// // //                       offset: Offset(0, cardOffset),
// // //                       child: Transform.rotate(
// // //                         angle: cardRotation,
// // //                         child: Padding(
// // //                           padding: const EdgeInsets.all(20.0),
// // //                           child: HelloWorldCard(
// // //                             size: cardSize,
// // //                             elevation: cardElevation,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class BlackHoleClipper extends CustomClipper<Path> {
// // //   @override
// // //   Path getClip(Size size) {
// // //     final path = Path();
// // //     path.moveTo(0, size.height / 2);
// // //     path.arcTo(
// // //       Rect.fromCenter(
// // //         center: Offset(size.width / 2, size.height / 2),
// // //         width: size.width,
// // //         height: size.height,
// // //       ),
// // //       0,
// // //       pi,
// // //       true,
// // //     );
// // //     // Using -1000 guarantees the card won't be clipped at the top, regardless of its height
// // //     path.lineTo(0, -1000);
// // //     path.lineTo(size.width, -1000);
// // //     path.close();
// // //     return path;
// // //   }

// // //   @override
// // //   bool shouldReclip(BlackHoleClipper oldClipper) => false;
// // // }

// // // class HelloWorldCard extends StatelessWidget {
// // //   const HelloWorldCard({
// // //     Key? key,
// // //     required this.size,
// // //     required this.elevation,
// // //   }) : super(key: key);

// // //   final double size;
// // //   final double elevation;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Material(
// // //       elevation: elevation,
// // //       borderRadius: BorderRadius.circular(10),
// // //       child: SizedBox.square(
// // //         dimension: size,
// // //         child: DecoratedBox(
// // //           decoration: BoxDecoration(
// // //             borderRadius: BorderRadius.circular(10),
// // //             color: Colors.blue,
// // //           ),
// // //           child: const Center(
// // //             child: Text(
// // //               'Hello\nWorld',
// // //               textAlign: TextAlign.center,
// // //               style: TextStyle(color: Colors.white, fontSize: 18),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // import 'dart:math';

// // // import 'package:animationtask/home.dart';
// // // import 'package:flutter/material.dart';

// // // class ArcPaint extends CustomPainter {
// // //   final double startAngle;
// // //   final double endAngle;

// // //   ArcPaint({super.repaint, required this.startAngle, required this.endAngle});
// // //   @override
// // //   void paint(Canvas canvas, Size size) {
// // //     var center = Offset.zero;
// // //     final paint = Paint()
// // //       ..color = Colors.green
// // //       ..strokeWidth = 10
// // //       ..style = PaintingStyle.fill;

// // //     final rect = Rect.fromCircle(center: center, radius: 38);
// // //     canvas.drawArc(rect, startAngle, endAngle, true, paint);
// // //   }

// // //   @override
// // //   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// // // }

// // // class LinerPaint extends CustomPainter {
// // //   final Animation<Offset> first;
// // //   final Animation<Offset> second;
// // //   final Offset firstDot;
// // //   final Offset firstCommon;

// // //   final Offset secondDot;

// // //   LinerPaint({
// // //     super.repaint,
// // //     required this.first,
// // //     required this.second,
// // //     required this.firstDot,
// // //     required this.firstCommon,
// // //     required this.secondDot,
// // //   });

// // //   @override
// // //   void paint(Canvas canvas, Size size) {
// // //     double radius = 1;
// // //     final paint = Paint()
// // //       ..color = Colors.white
// // //       ..strokeWidth = 5
// // //       ..style = PaintingStyle.fill;
// // //     if (first.value != firstDot) {
// // //       canvas.drawCircle(firstDot, radius, paint);
// // //     }
// // //     canvas.drawLine(firstDot, first.value, paint);
// // //     if (first.value != firstDot) {
// // //       canvas.drawCircle(firstCommon, radius, paint);
// // //     }
// // //     canvas.drawLine(firstCommon, second.value, paint);
// // //     if (second.value != firstCommon) {
// // //       canvas.drawCircle(second.value, radius, paint);
// // //     }
// // //   }

// // //   @override
// // //   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// // // }

// // // class DotPainter extends CustomPainter {
// // //   final double radius;
// // //   final Offset offset;

// // //   DotPainter({super.repaint, required this.radius, required this.offset});
// // //   @override
// // //   void paint(Canvas canvas, Size size) {
// // //     final paint = Paint()
// // //       ..color = Colors.white
// // //       ..style = PaintingStyle.fill;
// // //     canvas.drawCircle(offset, radius, paint);
// // //   }

// // //   @override
// // //   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// // // }

// // void main() {
// //   runApp(Myapp());
// // }

// // class Myapp extends StatelessWidget {
// //   const Myapp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: DownloadButtonAnimation(),
// //     );
// //   }
// // }

// // class DownloadButtonAnimation extends StatefulWidget {
// //   const DownloadButtonAnimation({super.key});

// //   @override
// //   State<DownloadButtonAnimation> createState() =>
// //       _DownloadButtonAnimationState();
// // }

// // class _DownloadButtonAnimationState extends State<DownloadButtonAnimation>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController controller;
// //   @override
// //   void initState() {
// //     controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(seconds: 6),
// //     );
// //     // for reverse
// //     controller.addStatusListener((status) {
// //       if (status == AnimationStatus.completed) {
// //         return controller.reset();
// //       }
// //     });
// //     super.initState();
// //   }

// //   // // for width change
// //   late final Animation<double> width =
// //       Tween<double>(begin: 250, end: 90).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// // // for fontSize change
// //   late final Animation<double> fontSize =
// //       Tween<double>(begin: 30, end: 0).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.0, 0.3, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// //   // for opacity change

// //   late final Animation<double> opacity = TweenSequence([
// //     TweenSequenceItem(
// //         tween: Tween<double>(begin: 0.0, end: 1.0).chain(
// //           CurveTween(curve: Curves.fastOutSlowIn),
// //         ),
// //         weight: 50),
// //     TweenSequenceItem(
// //         tween: Tween<double>(begin: 1.0, end: 0.0).chain(
// //           CurveTween(curve: Curves.fastOutSlowIn),
// //         ),
// //         weight: 50),
// //   ]).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.03, 0.5, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// // // for circular arc
// //   late final Animation<double> arc =
// //       Tween<double>(begin: 0.0, end: 2 * pi).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.3, 0.8, curve: Curves.fastLinearToSlowEaseIn),
// //     ),
// //   );
// //   // for liner
// //   Offset firstDot = const Offset(-15, 5);
// //   Offset firstCommon = const Offset(-5, 15);
// //   Offset secondDot = const Offset(20, -10);
// //   late final Animation<Offset> first =
// //       Tween<Offset>(begin: firstDot, end: firstCommon).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.900, 0.99, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// //   late final Animation<Offset> second =
// //       Tween<Offset>(begin: firstCommon, end: secondDot).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.900, 0.99, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// //   // for animating center dot
// //   late final Animation<Offset> centerDot =
// //       Tween<Offset>(begin: Offset.zero, end: firstDot).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.8, 0.9, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// // // for  animating dot size
// //   late final Animation<double> dotSize =
// //       Tween<double>(begin: 8.0, end: 3.0).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.8, 0.9, curve: Curves.fastOutSlowIn),
// //     ),
// //   );
// //   // for  animating dot opacity
// //   late final Animation<double> dotOpacity =
// //       Tween<double>(begin: 0.0, end: 1.0).animate(
// //     CurvedAnimation(
// //       parent: controller,
// //       curve: const Interval(0.3, 0.9, curve: Curves.fastOutSlowIn),
// //     ),
// //   );

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: GestureDetector(
// //           onTap: () {
// //             controller.forward();
// //           },
// //           child: AnimatedBuilder(
// //             animation: controller,
// //             builder: (context, child) {
// //               return Stack(
// //                 alignment: Alignment.center,
// //                 children: [
// //                   Container(
// //                     width: width.value,
// //                     height: 90,
// //                     alignment: Alignment.center,
// //                     decoration: BoxDecoration(
// //                       // color: Colors.blue[100],
// //                       borderRadius: BorderRadius.circular(80),
// //                       border: Border.all(color: const Color.fromARGB(255, 42, 42, 43), width: 3),
// //                     ),
// //                     child: Text(
// //                       "Download",
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: fontSize.value,
// //                       ),
// //                     ),
// //                   ),
// //                   Opacity(
// //                     opacity: opacity.value,
// //                     child: const Icon(
// //                       Icons.arrow_downward,
// //                       size: 55,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   CustomPaint(
// //                     painter: ArcPaint(startAngle: -pi / 2, endAngle: arc.value),
// //                   ),
// //                   CustomPaint(
// //                     painter: LinerPaint(
// //                       first: first,
// //                       second: second,
// //                       firstDot: firstDot,
// //                       firstCommon: firstCommon,
// //                       secondDot: secondDot,
// //                     ),
// //                   ),
// //                   Opacity(
// //                     opacity: dotOpacity.value,
// //                     child: CustomPaint(
// //                       painter: DotPainter(
// //                         radius: dotSize.value,
// //                         offset: centerDot.value,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';
// // // import 'package:rive/rive.dart';

// // // class RiveLoginScreen extends StatefulWidget {
// // //   const RiveLoginScreen({super.key});

// // //   @override
// // //   State<RiveLoginScreen> createState() => _RiveLoginScreenState();
// // // }

// // // class _RiveLoginScreenState extends State<RiveLoginScreen> {
// // //   // for controller
// // //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// // //   final TextEditingController usernameController = TextEditingController();
// // //   final TextEditingController passwordController = TextEditingController();

// // //   SMIInput<bool>? isChecking;
// // //   SMIInput<bool>? isHandsUp;
// // //   SMIInput<bool>? trigSuccess;
// // //   SMIInput<bool>? trigFail;
// // //   SMINumber? numLook;

// // //   late StateMachineController? stateMachineController;
// // //   void isCheckField() {
// // //     isHandsUp?.change(false);
// // //     isChecking?.change(true);
// // //     numLook?.change(0);
// // //   }

// // //   void moveEyeBall(val) {
// // //     numLook?.change(val.length.toDouble());
// // //   }

// // //   void hidePassword() {
// // //     isHandsUp?.change(true);
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             SizedBox(
// // //               height: 300,
// // //               child: RiveAnimation.asset(
// // //                 "assets/animated_login_character.riv",
// // //                 stateMachines: const ["Login Machine"],
// // //                 onInit: (artBoard) {
// // //                   stateMachineController = StateMachineController.fromArtboard(
// // //                       artBoard,
// // //                       "Login Machine" // it must me same from rive name
// // //                       );
// // //                   if (stateMachineController == null) return;
// // //                   artBoard.addController(stateMachineController!);
// // //                   isChecking = stateMachineController?.findInput("isChecking");
// // //                   isHandsUp = stateMachineController?.findInput("isHandsUp");
// // //                   trigSuccess =
// // //                       stateMachineController?.findInput("trigSuccess");
// // //                   trigFail = stateMachineController?.findInput("trigFail");
// // //                   numLook = stateMachineController?.findSMI("numLook");
// // //                 },
// // //               ),
// // //             ),
// // //             // now for ui parts(login page),

// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // //               child: Container(
// // //                 alignment: Alignment.center,
// // //                 width: 400,
// // //                 decoration: BoxDecoration(
// // //                   boxShadow: const [
// // //                     BoxShadow(
// // //                         color: Colors.black38,
// // //                         spreadRadius: 10,
// // //                         blurRadius: 10),
// // //                   ],
// // //                   color: Colors.white,
// // //                   borderRadius: BorderRadius.circular(10),
// // //                 ),
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.symmetric(
// // //                     horizontal: 15,
// // //                     vertical: 20,
// // //                   ),
// // //                   child: Form(
// // //                       key: _formKey,
// // //                       child: Column(
// // //                         children: [
// // //                           // for username
// // //                           TextFormField(
// // //                             onChanged: moveEyeBall,
// // //                             onTap: isCheckField,
// // //                             controller: usernameController,
// // //                             style: const TextStyle(fontSize: 15),
// // //                             cursorColor: const Color.fromARGB(255, 176, 72, 99),
// // //                             decoration: InputDecoration(
// // //                               hintText: "Username",
// // //                               filled: true,
// // //                               border: OutlineInputBorder(
// // //                                 borderRadius: BorderRadius.circular(15),
// // //                               ),
// // //                               focusColor:
// // //                                   const Color.fromARGB(255, 176, 72, 99),
// // //                               focusedBorder: OutlineInputBorder(
// // //                                 borderSide: const BorderSide(
// // //                                   color: Color.fromARGB(255, 176, 72, 99),
// // //                                 ),
// // //                                 borderRadius: BorderRadius.circular(15),
// // //                               ),
// // //                             ),
// // //                             validator: (value) {
// // //                               if (value == null || value.isEmpty) {
// // //                                 return "Pleaase enter the valid username";
// // //                               }
// // //                               return null;
// // //                             },
// // //                           ),
// // //                           // eye is moving
// // //                           const SizedBox(height: 20),
// // //                           TextFormField(
// // //                             onTap: hidePassword,
// // //                             controller: passwordController,
// // //                             obscureText: true,
// // //                             style: const TextStyle(fontSize: 15),
// // //                             cursorColor: const Color.fromARGB(255, 176, 72, 99),
// // //                             decoration: InputDecoration(
// // //                               hintText: "Password",
// // //                               filled: true,
// // //                               border: OutlineInputBorder(
// // //                                 borderRadius: BorderRadius.circular(15),
// // //                               ),
// // //                               focusColor:
// // //                                   const Color.fromARGB(255, 176, 72, 99),
// // //                               focusedBorder: OutlineInputBorder(
// // //                                 borderSide: const BorderSide(
// // //                                   color: Color.fromARGB(255, 176, 72, 99),
// // //                                 ),
// // //                                 borderRadius: BorderRadius.circular(15),
// // //                               ),
// // //                             ),
// // //                             validator: (value) {
// // //                               if (value == null || value.isEmpty) {
// // //                                 return "Pleaase enter the valid password";
// // //                               }
// // //                               return null;
// // //                             },
// // //                           ),
// // //                           const SizedBox(height: 25),
// // //                           Container(
// // //                             height: 50,
// // //                             width: 300,
// // //                             decoration: BoxDecoration(
// // //                                 borderRadius: BorderRadius.circular(30),
// // //                                 color: Colors.blue[200]),
// // //                             child: InkWell(
// // //                               onTap: () {
// // //                                 if (_formKey.currentState!.validate()) {
// // //                                   isChecking!.change(false);
// // //                                   isHandsUp!.change(false);
// // //                                  trigFail!.change(false);
// // //                                   trigSuccess!.change(true); // for success
// // //                                   isChecking!.change(false);
// // //                                 } else{
// // //                                   isChecking!.change(false);
// // //                                   isHandsUp!.change(false);
// // //                                   trigFail!.change(true);// for unsuccess
// // //                                   trigSuccess!.change(false);
// // //                                   isChecking!.change(false);
// // //                                 }

// // //                               },
// // //                               child: const Center(
// // //                                 child: Text(
// // //                                   "Login",
// // //                                   style: TextStyle(
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 18),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       )),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: AnimatedButton());
//   }
// }

// class AnimatedButton extends StatefulWidget {
//   AnimatedButton({super.key});

//   @override
//   State<AnimatedButton> createState() => _AnimatedButtonState();
// }

// class _AnimatedButtonState extends State<AnimatedButton>
//     with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   late Animation<double> _animation;
//   static List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page'),
//     Text('Search Page'),
//     Text('Profile Page'),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     )..repeat();
//     // for reverse  as well
//     // controller.addStatusListener((status) {
//     //   if (status == AnimationStatus.completed) {
//     //     controller.repeat();
//     //   }

//     //   //  else if (status == AnimationStatus.dismissed) {
//     //   //   controller.forward(from: 0.1);
//     //   // }
//     // }

//     // );
//     // controller.forward();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBody: true,
//         body: Center(
//           child: Container(
//               height: 100,
//               width: 100,
//               child: InkWell(
//                   onTap: () {
//                     print("object");
//                   },
//                   child: Icon(Icons.add_reaction))),
//         ),
//         backgroundColor: Colors.white,
//         bottomNavigationBar: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//             TextButton(onPressed: () {}, child: Icon(Icons.abc_outlined)),
//             AnimatedBuilder(
//               animation: controller,
//               builder: (context, index) {
//                 return Container(
//                   height: 80,
//                   alignment: Alignment.center,

//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     // borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(colors: [
//                       Color.fromARGB(255, 46, 49, 211),
//                       Colors.white,
//                       Colors.blue,
//                     ], stops: [
//                       0.0,
//                       controller.value,
//                       1.0,
//                     ]),
//                   ),
//                   child:
//                   Text("data")

//                   //  Card(
//                   //   semanticContainer: true,
//                   //   shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(20)),
//                   //   child: ClipRRect(
//                   //     borderRadius: BorderRadius.circular(15),
//                   //     child: SizedBox(
//                   //       height: 100,
//                   //       child: BottomNavigationBar(
//                   //         useLegacyColorScheme: false,
//                   //         items: const <BottomNavigationBarItem>[
//                   //           BottomNavigationBarItem(
//                   //             icon: Icon(Icons.home),
//                   //             label: 'Home',
//                   //           ),
//                   //           BottomNavigationBarItem(
//                   //             icon: Icon(Icons.search),
//                   //             label: 'Search',
//                   //           ),
//                   //           BottomNavigationBarItem(
//                   //             icon: Icon(Icons.person),
//                   //             label: 'Profile',
//                   //           ),
//                   //         ],
//                   //         currentIndex: _selectedIndex,
//                   //         selectedItemColor: Colors.blue,
//                   //         onTap: _onItemTapped,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                 );
//               },
//             ),
//           ]),
//         ));
//   }
// }

// // class MyButtonItems extends StatefulWidget {
// //   final Widget child;
// //   final Color color;
// //   const MyButtonItems({super.key, required this.child, required this.color});

// //   @override
// //   State<MyButtonItems> createState() => _MyButtonItemsState();
// // }

// // class _MyButtonItemsState extends State<MyButtonItems>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 2000),
// //     )..repeat();
// //     // for reverse  as well
// //     // controller.addStatusListener((status) {
// //     //   if (status == AnimationStatus.completed) {
// //     //     controller.repeat();
// //     //   }

// //     //   //  else if (status == AnimationStatus.dismissed) {
// //     //   //   controller.forward(from: 0.1);
// //     //   // }
// //     // }

// //     // );
// //     // controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return AnimatedBuilder(
// //       animation: controller,
// //       builder: (context, index) {
// //         return Container(
// //           height: 80,
// //           alignment: Alignment.center,
// //           // padding: const EdgeInsets.all(15),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(20),
// //             gradient: LinearGradient(colors: [
// //               Color.fromARGB(255, 46, 49, 211),
// //               widget.color,
// //               Colors.blue,
// //             ], stops: [
// //               0.0,
// //               controller.value,
// //               1.0,
// //             ]),
// //           ),
// //           child: widget.child,
// //         );
// //       },
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _selectedIndex = 0;

// //   static List<Widget> _widgetOptions = <Widget>[
// //     Text('Home Page'),
// //     Text('Search Page'),
// //     Text('Profile Page'),
// //   ];

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Bottom Navigation Example'),
// //       ),
// //       body: Center(
// //         child: _widgetOptions.elementAt(_selectedIndex),
// //       ),
// //       bottomNavigationBar: Padding(
// //         padding: const EdgeInsets.all(20),
// //         child: Container(
// //           color: Colors.black26,
// //           child: BottomNavigationBar(
// //           // backgroundColor: const Color.fromARGB(255, 240, 224, 178),
// //             items: const <BottomNavigationBarItem>[
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.home),
// //                 label: 'Home',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.search),
// //                 label: 'Search',
// //               ),
// //               BottomNavigationBarItem(
// //                 icon: Icon(Icons.person),
// //                 label: 'Profile',
// //               ),
// //             ],
// //             currentIndex: _selectedIndex,
// //             selectedItemColor: Colors.blue,
// //             onTap: _onItemTapped,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // herooooooooooooooooooooooooooooooooo

// // class HeroAnimation extends StatelessWidget {
// //   const HeroAnimation({super.key});

// //   Widget build(BuildContext context) {
// //     timeDilation = 1.0; // 1.0 means normal animation speed.

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Basic Hero Animation'),
// //       ),
// //       body: Center(
// //         child: PhotoHero(
// //           photo: 'assets/image1.png',
// //           width: 300.0,
// //           onTap: () {
// //             Navigator.of(context)
// //                 .push(MaterialPageRoute<void>(builder: (context) {
// //               return Scaffold(
// //                 appBar: AppBar(
// //                   title: const Text('Flippers Page'),
// //                 ),
// //                 body: Container(
// //                   // Set background to blue to emphasize that it's a new route.
// //                   color: Colors.lightBlueAccent,
// //                   padding: const EdgeInsets.all(16),
// //                   alignment: Alignment.topLeft,
// //                   child: PhotoHero(
// //                     photo: 'assets/image1.png',
// //                     width: 100.0,
// //                     onTap: () {
// //                       Navigator.of(context).pop();
// //                     },
// //                   ),
// //                 ),
// //               );
// //             }));
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class PhotoHero extends StatelessWidget {
// //   const PhotoHero({
// //     super.key,
// //     required this.photo,
// //     this.onTap,
// //     required this.width,
// //   });

// //   final String photo;
// //   final VoidCallback? onTap;
// //   final double width;

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: width,
// //       child: Hero(
// //         tag: photo,
// //         child: Material(
// //           color: Colors.transparent,
// //           child: InkWell(
// //             onTap: onTap,
// //             child: Image.asset(
// //               photo,
// //               fit: BoxFit.contain,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: HeroAnimation(),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';

// /// Flutter code sample for [Hero].

// void main() {
//   // Slow down time to see Hero flight animation.
//   timeDilation = 15.0;
//   runApp(const HeroApp());
// }

// class HeroApp extends StatelessWidget {
//   const HeroApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const HeroExample(),
//     );
//   }
// }

// class HeroExample extends StatelessWidget {
//   const HeroExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Hero Sample')),
//       body: Column(
//         children: <Widget>[
//           ListTile(
//             onTap: () {
//               _gotoDetailsPage(context);
//             },
//             leading: Hero(
//               tag: 'hero-default-tween',
//               child: BoxWidget(
//                 size: const Size(50.0, 50.0),
//                 color: Colors.red[700]!.withOpacity(0.5),
//               ),
//             ),
//             title: const Text(
//               'This red icon will use a default rect tween during the hero flight.',
//             ),
//           ),
//           const SizedBox(height: 10.0),
//           ListTile(
//             leading: Hero(
//               tag: 'hero-custom-tween',
//               // createRectTween: (Rect? begin, Rect? end) {
//               //   return MaterialRectCenterArcTween(begin: begin, end: end);
//               // },
//               child: BoxWidget(
//                 size: const Size(70.0, 70.0),
//                 color: Colors.blue[700]!.withOpacity(0.5),
//               ),
//             ),
//             title: const Text(
//               'This blue icon will use a custom rect tween during the hero flight.',
//             ),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () => _gotoDetailsPage(context),
//             child: const Text('Tap to trigger hero flight'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _gotoDetailsPage(BuildContext context) {
//     Navigator.of(context).push(MaterialPageRoute<void>(
//       builder: (BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text('Second Page'),
//         ),
//         body: Align(
//           alignment: Alignment.bottomRight,
//           child: Stack(
//             children: <Widget>[
//               Hero(
//                 tag: 'hero-custom-tween',
//                 createRectTween: (Rect? begin, Rect? end) {
//                   return MaterialRectCenterArcTween(begin: begin, end: end);
//                 },
//                 child: Container(
//                   height: 400,
//                   width: 200,
//                   color: Colors.blue[700]!.withOpacity(0.5),
//                 ),
//               ),
//               Hero(
//                 tag: 'hero-default-tween',
//                 child: Container(
//                   height: 400,
//                   width: 300,
//                   color: Colors.red[700]!.withOpacity(0.5),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// class BoxWidget extends StatelessWidget {
//   const BoxWidget({
//     super.key,
//     required this.size,
//     required this.color,
//   });

//   final Size size;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size.width,
//       height: size.height,
//       color: color,
//     );
//   }
// }
