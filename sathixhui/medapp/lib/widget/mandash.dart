

// //  import 'package:flutter/material.dart';
// // import 'package:medapp/widget/billerwidget.dart';

// // Widget managrDash(context,){
// // return   Padding(padding: EdgeInsets.all(30.0),
// // child: Center(
  
// //             child: Column(
// //                mainAxisAlignment: MainAxisAlignment.start,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 Text("DASHBOARD",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                   
// //                 SizedBox(
// //                    height: MediaQuery.of(context).size.height * 0.08,),
// //                 SizedBox(
// //                    height: MediaQuery.of(context).size.height * 0.20,
// //                 width: MediaQuery.of(context).size.width * 0.70,
// //                   child: Card(
// //                     elevation: 20.0,
// //                     child: Column(
// //                          mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
                      
// //                         Text(" Today sales",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
// //                          SizedBox(
// //                             height: MediaQuery.of(context).size.height * 0.03,
// //                           ),
                          
// //                           Text("RS.${""}",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.blue),),
// //                       ],
// //                     ),
                    
                
// //                   ),
// //                 ),
// //                                 SizedBox(
// //                    height: MediaQuery.of(context).size.height * 0.08,),
// //                    SizedBox(
// //                    height: MediaQuery.of(context).size.height * 0.20,
// //                 width: MediaQuery.of(context).size.width * 0.70,
// //                   child: Card(
// //                     elevation: 20.0,
// //                     child: Column(
// //                          mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                       children: [
                      
// //                         Text(" Current Invenrtry Value",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
// //                          SizedBox(
// //                             height: MediaQuery.of(context).size.height * 0.03,
// //                           ),
                          
// //                           Text("RS.${""}",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.blue),),
// //                       ],
// //                     ),
                    
                
// //                   ),
// //                 ),

                
// //               ],
// //             ),
      
// //            ),

// // );

// // }

















// import 'package:flutter/material.dart';
// import 'package:medapp/dats.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SalesReport extends StatefulWidget {
//   @override
//   _SalesReportState createState() => _SalesReportState();
// }

// class _SalesReportState extends State<SalesReport> {
//   List<BillDetail> billList = [];
//   List<BillMaster> billMasters = [];
//   List<Map<String, dynamic>> mergedList = [];
//   List<Map<String, dynamic>> filteredMergedList = [];

//   TextEditingController searchController = TextEditingController();
//   TextEditingController fromController = TextEditingController();
//   TextEditingController toController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     retrieveBillList();
//   }

//   Future<void> retrieveBillList() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedBillList = prefs.getStringList('billDetails');
//     final savedBillMasters = prefs.getStringList('billMasters');

//     if (savedBillMasters != null) {
//       billMasters = savedBillMasters
//           .map((data) => BillMaster.fromJson(data as Map<String, dynamic>))
//           .toList();
//     }

//     if (savedBillList != null) {
//       billList = savedBillList.map((billString) {
//         final parts = billString.split(', ');
//         return BillDetail(
//           billNo: parts[0],
//           medicineName: parts[1],
//           quantity: int.parse(parts[2]),
//           unitPrice: double.parse(parts[3]),
//           amount: double.parse(parts[4]),
//         );
//       }).toList();
//     }

//     if (billMasters.isNotEmpty && billList.isNotEmpty) {
//       for (var bill in billList) {
//         Map<String, dynamic> mergedData = {
//           'billNo': bill.billNo,
//           'medicineName': bill.medicineName,
//           'quantity': bill.quantity,
//           'unitPrice': bill.unitPrice,
//           'amount': bill.amount,
//           'billDate': getBillDate(bill.billNo),
//         };
//         mergedList.add(mergedData);
//       }

//       setState(() {
//         filteredMergedList = mergedList;
//       });
//       print(filteredMergedList);
//     }
//   }

//   String getBillDate(String billNo) {
//     var billMaster = billMasters.firstWhere(
//       (bm) => bm.billNo == billNo,
//       orElse: () => BillMaster(billNo: billNo, billDate: "", totalBillAmount: 0, gstAmount: 0, netPayableAmount: 0, userName: ''),
//     );

//     return billMaster.billDate;
//   }

//   void filterByDate() {
//     final fromDate = DateTime.parse(fromController.text);
//     final toDate = DateTime.parse(toController.text);

//     filteredMergedList = mergedList.where((bill) {
//       DateTime billDate = DateTime.parse(bill['billDate']);
//       return billDate.isAfter(fromDate) && billDate.isBefore(toDate);
//     }).toList();

//     setState(() {});
//   }

//   Future<void> selectDate(TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null) {
//       controller.text = DateFormat('yyyy-MM-dd').format(picked);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sales Report'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => selectDate(fromController),
//                   child: Text('Select From Date'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => selectDate(toController),
//                   child: Text('Select To Date'),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: filterByDate,
//               child: Text('Search Date'),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: [
//                   DataColumn(label: Text('Bill Date')),
//                   DataColumn(label: Text('Medicine Name')),
//                   DataColumn(label: Text('Quantity')),
//                   DataColumn(label: Text('Unit Price')),
//                   DataColumn(label: Text('Amount')),
//                 ],
//                 rows: filteredMergedList.map((bill) {
//                   return DataRow(
//                     cells: [
//                       DataCell(Text(bill['billDate'])),
//                       DataCell(Text(bill['medicineName'])),
//                       DataCell(Text(bill['quantity'].toString())),
//                       DataCell(Text(bill['unitPrice'].toString())),
//                       DataCell(Text(bill['amount'].toString())),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }














// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class SalesReport extends StatefulWidget {
//   @override
//   _SalesReportState createState() => _SalesReportState();
// }

// class _SalesReportState extends State<SalesReport> {
//   List<BillDetail> billList = [];

//   TextEditingController searchController = TextEditingController();
//   DateTime? fromDate;
//   DateTime? toDate;

//   @override
//   void initState() {
//     super.initState();
//     retrieveBillList();
//   }

//   retrieveBillList() async {
//     // Your existing code to retrieve bill details from SharedPreferences
//     // ...

//     setState(() {
//       // Update state with retrieved billList data
//     });
//   }

//   String getBillDate(String billNo) {
//     // Your existing getBillDate function
//     // ...
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<BillDetail> filteredListByDate = [];

//     if (fromDate != null && toDate != null) {
//       filteredListByDate = billList.where((bill) {
//         final billDate = DateTime.parse(getBillDate(bill.billNo));
//         return billDate.isAfter(fromDate!) && billDate.isBefore(toDate!);
//       }).toList();
//     }

//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//               // Your other UI elements
//               // ...

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       final selectedFromDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                       );
//                       if (selectedFromDate != null) {
//                         setState(() {
//                           fromDate = selectedFromDate;
//                         });
//                       }
//                     },
//                     child: Text(fromDate != null ? 'From: ${fromDate!.toLocal()}' : 'Select From Date'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () async {
//                       final selectedToDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                       );
//                       if (selectedToDate != null) {
//                         setState(() {
//                           toDate = selectedToDate;
//                         });
//                       }
//                     },
//                     child: Text(toDate != null ? 'To: ${toDate!.toLocal()}' : 'Select To Date'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {});
//                     },
//                     child: Text('Search Date'),
//                   ),
//                 ],
//               ),

//               if (filteredListByDate.isEmpty)
//                 Column(
//                   children: [
//                     SizedBox(height: 40.0),
//                     Text(
//                       'No data found',
//                       style: TextStyle(fontSize: 16, color: Colors.red),
//                     ),
//                   ],
//                 ),

//               if (filteredListByDate.isNotEmpty)
//                 DataTable(
//                   columns: [
//                     DataColumn(label: Text('Bill Date')),
//                     DataColumn(label: Text('Med Name')),
//                     DataColumn(label: Text('Qnty')),
//                     DataColumn(label: Text('U Price')),
//                     DataColumn(label: Text('Amount')),
//                     DataColumn(label: Text('BillNo')),
//                   ],
//                   rows: filteredListByDate.map((bill) {
//                     return DataRow(cells: [
//                       DataCell(Text(getBillDate(bill.billNo))),
//                       DataCell(Text(bill.medicineName)),
//                       DataCell(Text(bill.quantity.toString())),
//                       DataCell(Text(bill.unitPrice.toString())),
//                       DataCell(Text(bill.amount.toString())),
//                       DataCell(Text(bill.billNo.toString())),
//                     ]);
//                   }).toList(),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Sample BillDetail class for reference
// class BillDetail {
//   final String medicineName;
//   final int quantity;
//   final double unitPrice;
//   final double amount;
//   final String billNo;

//   BillDetail({
//     required this.medicineName,
//     required this.quantity,
//     required this.unitPrice,
//     required this.amount,
//     required this.billNo,
//   });
// }
