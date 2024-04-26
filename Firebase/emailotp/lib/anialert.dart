// import 'package:flutter/material.dart';
// import 'package:quickalert/quickalert.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'QuickAlert Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(),
// //     );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final successAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.success,
//           text: ' Completed Successfully!',
//           autoCloseDuration: const Duration(seconds: 2),
//           showConfirmBtn: false,
//         );
//       },
//       title: 'Success',
//       text: 'Email verfied Sucessfully',
//       leadingImage: 'assets/images/verified-unscreen.gif',
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           const SizedBox(height: 20),
//           successAlert,
//         ],
//       ),
//     );
//   }

//   Card buildButton({
//     required onTap,
//     required title,
//     required text,
//     required leadingImage,
//   }) {
//     return Card(
//       shape: const StadiumBorder(),
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//       ),
//       clipBehavior: Clip.antiAlias,
//       elevation: 1,
//       child: ListTile(
//         onTap: onTap,
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(
//             leadingImage,
//           ),
//         ),
//         title: Text(title ?? ""),
//         subtitle: Text(text ?? ""),
//         trailing: const Icon(
//           Icons.keyboard_arrow_right_rounded,
//         ),
//       ),
//     );
//   }
// }
