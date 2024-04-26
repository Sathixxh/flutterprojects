
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:medapp/dats.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class BillerSalesScreen extends StatefulWidget {
//   final String loggedInUserRole;
//   final String currentuser;

//   BillerSalesScreen({required this.loggedInUserRole, required this.currentuser});

//   @override
//   _BillerSalesScreenState createState() => _BillerSalesScreenState();
// }

// class _BillerSalesScreenState extends State<BillerSalesScreen> {
//   double todaysale = 0.0;
//   List<BillMaster> billMasters = [];

//   @override
//   void initState() {
//     super.initState();
//     tracetodays();
//   }

//   tracetodays() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? savedBillList = prefs.getStringList('billDetails') ?? [];
//     final savedBillMasters = prefs.getString('billMasters');
//     if (savedBillMasters != null) {
//       final List<dynamic> billMastersJson = jsonDecode(savedBillMasters);
//       billMasters = billMastersJson.map((data) => BillMaster.fromJson(data)).toList();

//       filterByUserRole(widget.currentuser);
//     }

//     setState(() {});
//   }

//   void filterByUserRole(String usersName) {
//     final today = DateTime.now().toString().split(' ')[0];
//     if (widget.loggedInUserRole == 'biller') {
//       todaysale = billMasters
//           .where((billMaster) =>
//               billMaster.billDate == today && billMaster.userName == usersName)
//           .fold<double>(0.0, (total, billMaster) => total + billMaster.totalBillAmount);
//      }
//     else if (widget.loggedInUserRole == 'manager') {
//       todaysale = billMasters
//           .where((billMaster) =>
//               billMaster.billDate == today && billMaster.userName == usersName)
//           .fold<double>(0.0, (total, billMaster) => total + billMaster.totalBillAmount);
//           print(todaysale);
//     }


//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(30.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "DASHBOARD",
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueAccent),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.08),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.20,
//                 width: MediaQuery.of(context).size.width * 0.70,
//                 child: Card(
//                   elevation: 20.0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Your Today sales",
//                         style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       Text(
//                         "RS.${todaysale.toStringAsFixed(2)}",
//                         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
   
