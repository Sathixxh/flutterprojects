// import 'package:flutter/material.dart';
// import 'package:onboardscreen/utils.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: primaryColor,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(40),
//                   bottomRight: Radius.circular(40),
//                 ),
//               ),
//               height: MediaQuery.of(context).size.height * 0.89,
//               width: MediaQuery.of(context).size.width * 0.55,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 200, 30, 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(
//                           Icons.account_circle,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Account',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(
//                           Icons.security,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Security',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(
//                           Icons.logout,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Logout',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(
//                           Icons.palette,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Theme',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(
//                           Icons.settings,
//                           color: Colors.black,
//                           size: 30,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           'Settings',
//                           style: TextStyle(color: Colors.black, fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: double.infinity,
//               width: MediaQuery.of(context).size.width * 0.45,
//               color: Colors.white,
//             ),
//           ],
//         ),
//         Positioned(top: 60, left: 100, child: RotatingContainer()),
//         Positioned(top: 275, left: 190, child: Text("data")),
      
//       ],
//     );
//   }
// }

// class RotatingContainer extends StatefulWidget {
//   @override
//   _RotatingContainerState createState() => _RotatingContainerState();
// }

// class _RotatingContainerState extends State<RotatingContainer>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       animationBehavior: AnimationBehavior.preserve,
//       vsync: this,
//       duration: Duration(seconds: 1),
//     )..forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RotationTransition(
//       turns: _controller,
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white,
//           border: Border.all(color: Colors.white, width: 5),
//         ),
//         child: ClipOval(
//           child: Image.asset(
//             "assets/illustration/IMG_20231013_233821_479.jpg",
//             width: 200,
//             height: 200,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }





import 'package:flutter/material.dart';
import 'package:onboardscreen/utils.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Widget _buildDrawerItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.89,
              width: MediaQuery.of(context).size.width * 0.55,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 200, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildDrawerItem(Icons.account_circle, 'Account'),
                    SizedBox(height: 20),
                    _buildDrawerItem(Icons.security, 'Security'),
                    SizedBox(height: 20),
                    _buildDrawerItem(Icons.logout, 'Logout'),
                    SizedBox(height: 20),
                    _buildDrawerItem(Icons.palette, 'Theme'),
                    SizedBox(height: 20),
                    _buildDrawerItem(Icons.settings, 'Settings'),



                    
                  ],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.45,
              color: Colors.white,
            ),
          ],
        ),
        Positioned(top: 60, left: 100, child: RotatingContainer()),
        Positioned(top: 275, left: 190, child: Text("data")),
      
      ],
    );
  }
}

class RotatingContainer extends StatefulWidget {
  @override
  _RotatingContainerState createState() => _RotatingContainerState();
}

class _RotatingContainerState extends State<RotatingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 5),
        ),
        child: ClipOval(
          child: Image.asset(
            "assets/illustration/IMG_20231013_233821_479.jpg",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
