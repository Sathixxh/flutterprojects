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
//     );
//     // for reverse  as well
//     controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         controller.forward(from: 0.1);
//       }
//     });
//     controller.forward();
//   }@override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: Center(
//         child: AnimatedBuilder(
//           animation: controller,
//           builder: (context, index) {
//             return Container(
//               height: 100,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,

//                 // borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                   transform: GradientRotation(15),
                  
//                   colors: [
                
//                   Colors.red,
//                   Colors.white,
//                   Colors.green,
//                 ], stops: [
//                   0.0,
//                   controller.value,
//                   1.0,
//                 ]),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 235, 246, 255),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Container(
//                   height: 90,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimatedButton());
  }
}

class AnimatedButton extends StatefulWidget {
  AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // 10 seconds for initial gradient
    );

    controller.addStatusListener((status) {
   
    });

    _animation = Tween<double>(begin: 0.0, end: 0.9).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Background gradient
              //   Container(
              //     height: 100,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       gradient: LinearGradient(
              //         transform: GradientRotation(15),
              //         colors: [
              //           // Initial gradient
              //           Colors.green,
              //           Colors.white,
              //           Colors.red,
              //         ],
              //         stops: [
              //           0.0,
              //           controller.value, // Control the progress of the initial gradient animation
              //           1.0,
              //         ],
              //       ),
              //     ),
              //     child:Container(
              //   decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 235, 246, 255),
              //     shape: BoxShape.circle,
              //   ),
              //   child: Container(
              //     height: 90,
              //   ),
              // ), 
              //   ),
                // Animated tick icon
                if (controller.status == AnimationStatus.completed)
                  ScaleTransition(
                    scale: _animation,
                    child: Icon(Icons.check, color: Colors.black, size: 50),
                  ),
              ],
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
