// import 'package:flutter/material.dart';

// import '../../../../core/core.dart';

// import '../widgets/infinite_dragable_slider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({
//     super.key,
//     this.enableEntryAnimation = false,
//     this.initialIndex = 0,
//   });

//   final bool enableEntryAnimation;
//   final int initialIndex;

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   final List<Magazine> magazines = Magazine.fakeMagazinesValues;
//   late int currentIndex;

//   @override
//   void initState() {
//     currentIndex = widget.initialIndex;

//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DecoratedBox(
//         decoration: ViceUIConsts.gradientDecoration,
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           body: Column(
//             children: [
//               SizedBox(height: 12),
//               SizedBox(height: 20),
//               SizedBox(height: 24),
//               Expanded(
//                 child: InfiniteDragableSlider(
//                   iteamCount: Magazine.fakeMagazinesValues.length,
//                   itemBuilder: (context, index) => MagazineCoverImage(
//                       magazine: Magazine.fakeMagazinesValues[index]),
//                 ),
//               ),
//               SizedBox(height: 72),
//               SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


