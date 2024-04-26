
import 'package:flutter/material.dart';



medicinetable(context,{required String medicinename,required String brand,required double Quantity,required double price} ){
  return Row(
   crossAxisAlignment: CrossAxisAlignment.start,
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: [
     Text(medicinename,style: TextStyle(color: const Color.fromARGB(255, 111, 170, 114),fontSize: 20.0,fontWeight: FontWeight.bold),),
     Text(brand,style: TextStyle(fontSize: 20.0),),Text(Quantity.toString()),
     Text( price.toString()),
   ],

  );
 
}



scafWidgets(context ,{required String smsg,required Color coolors}){
   ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(smsg),
            backgroundColor:coolors,
            elevation: 20,
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20.0)),
            behavior: SnackBarBehavior.fixed,
             duration: Duration(seconds: 2), 
          ),
        );

}















// class SalesReport extends StatefulWidget {
//   @override
//   _SalesReportState createState() => _SalesReportState();
// }

// class _SalesReportState extends State<SalesReport> {
//    List? fetchSave;
//      List<Map<String, dynamic>> mergedList = [];
//   List<Map<String, dynamic>> filteredMergedList = [];
//   List<BillDetail> billList = [];
//   List<BillMaster> billMasters = [];
//   DateTime fromDate = DateTime.now();
//    List<BillDetail> filteredList =[];
//   DateTime toDate = DateTime.now();
//   List<BillMaster> filteredBillMaster = [];
//     TextEditingController searchController = TextEditingController();
//     TextEditingController fromController = TextEditingController();
//     TextEditingController toController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     retrieveBillList();
    
//     setState(() {
      
//     });

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
//  retrieveBillList() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedBillList = prefs.getStringList('billDetails');
//     final savedBillMasters = prefs.getString('billMasters');
//    fetchSave=jsonDecode(savedBillMasters!);
 
//     print(savedBillMasters);
//     print(savedBillList);
    

//     if (savedBillMasters != null) {
//       final List<dynamic> billMastersJson = jsonDecode(savedBillMasters);
//       billMasters = billMastersJson
//           .map((data) => BillMaster.fromJson(data))
//           .toList();
//     }

//     if (savedBillList != null) {
//       final loadedBillDetails = savedBillList.map((billString) {
//         final parts = billString.split(', ');
//         return BillDetail(
//           medicineName: parts[0],
//           quantity: int.parse(parts[1]),
//           unitPrice: double.parse(parts[2]),
//           amount: double.parse(parts[3]),
//           billNo: parts[4],
//         );
//       }).toList();

//       setState(() {
//         billList = loadedBillDetails;
        
//       });
//     }
//        if (billMasters.isNotEmpty && billList.isNotEmpty) {
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
//     final billMaster = billMasters.firstWhere(
//       (bm) => bm.billNo == billNo,
//       orElse: () => BillMaster(
//         billNo: billNo,
//         billDate: "",
//         totalBillAmount: 0,
//         gstAmount: 0,
//         netPayableAmount: 0,
//         userName: '',
//       ),
//     );

//     return billMaster.billDate;
//   }



//   @override
//   Widget build(BuildContext context) {
//     filteredList = billList.where((bill) {
//       final String searchvalue = searchController.text.toLowerCase();
//       return bill.medicineName.toLowerCase().contains(searchvalue) ||
//           bill.quantity.toString().contains(searchvalue) ||
//           bill.unitPrice.toString().contains(searchvalue) ||
//           bill.billNo.contains(searchvalue) ||
//           getBillDate(bill.billNo).contains(searchvalue);
//     }).toList();

//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//                SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               Text("Sales Report",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
//                  ExpansionTile(
//               title: Text('Search'),
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(25.0),
//                   child: Column(
//                     children: [
//                     Row(
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
//                       ElevatedButton(
//               onPressed: filterByDate,
//               child: Text('Search Date'),
//             ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
             
//               SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//               ),
           
             
//  TextField(
//                       controller: searchController,
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white70,
//                         hintText: 'Search',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         suffixIcon: Icon(Icons.search),
//                       ),
//                     ),

//                       if (filteredList.isEmpty)
//                      Column(
                 
//                        children: [
//                         SizedBox(height: 40.0,),
//                          Text(
                          
//                                          'No data found',
//                                            style: TextStyle(fontSize: 16, color: Colors.red),
//                                      ),
//                        ],
//                      ),
//             if (filteredList.isNotEmpty) 
//               Expanded(
          
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       DataTable(
//                         columnSpacing: 3,
//                         columns: <DataColumn>[
//                           DataColumn(label: Text('Bill Date')),
//                           DataColumn(label: Text('Med Name')),
//                           DataColumn(label: Text('Qnty')),
//                           DataColumn(label: Text('U Price')),
//                           DataColumn(label: Text('Amount')),
//                           DataColumn(label: Text('BillNo')),
//                         ],
//                              rows: filteredMergedList.map((bill) {
//                   return DataRow(
//                     cells: [
//                       DataCell(Text(bill['billDate'])),
//                       DataCell(Text(bill['medicineName'])),
//                       DataCell(Text(bill['quantity'].toString())),
//                       DataCell(Text(bill['unitPrice'].toString())),
//                       DataCell(Text(bill['amount'].toString())),
//                         DataCell(Text(bill['billNo'].toString())),
//                     ],
//                   );
//                         }).toList(),
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



















//    import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:medapp/dats.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

// class SalesReport extends StatefulWidget {
//   @override
//   _SalesReportState createState() => _SalesReportState();
// }

// class _SalesReportState extends State<SalesReport> {
//    List? fetchSave;
//   List<BillDetail> billList = [];
//   List<BillMaster> billMasters = [];
//   DateTime fromDate = DateTime.now();
//    List<BillDetail> filteredList =[];
//   DateTime toDate = DateTime.now();
//   List<BillMaster> filteredBillMaster = [];
//     TextEditingController searchController = TextEditingController();
//     TextEditingController fromController = TextEditingController();
//     TextEditingController toController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     retrieveBillList();
//     filterSalesData();
//     setState(() {
      
//     });

//   }


//   Future<void> filterSalesData() async {
//     setState(() {
//          filteredList = billList.where((bill) {
//       final String searchvalue = searchController.text.toLowerCase();
//       return bill.medicineName.toLowerCase().contains(searchvalue) ||
//           bill.quantity.toString().contains(searchvalue) ||
//           bill.unitPrice.toString().contains(searchvalue) ||
//           bill.billNo.contains(searchvalue) ||
//           getBillDate(bill.billNo).contains(searchvalue);
//     }).toList();

//     });
//     print(filteredList);
//   }

// selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != controller.text) {
//       String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
//       controller.text = formattedDate;
//     }
//   }
//  retrieveBillList() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedBillList = prefs.getStringList('billDetails');
//     final savedBillMasters = prefs.getString('billMasters');
//    fetchSave=jsonDecode(savedBillMasters!);
 
//     print(savedBillMasters);
//     print(savedBillList);
    

//     if (savedBillMasters != null) {
//       final List<dynamic> billMastersJson = jsonDecode(savedBillMasters);
//       billMasters = billMastersJson
//           .map((data) => BillMaster.fromJson(data))
//           .toList();
//     }

//     if (savedBillList != null) {
//       final loadedBillDetails = savedBillList.map((billString) {
//         final parts = billString.split(', ');
//         return BillDetail(
//           medicineName: parts[0],
//           quantity: int.parse(parts[1]),
//           unitPrice: double.parse(parts[2]),
//           amount: double.parse(parts[3]),
//           billNo: parts[4],
//         );
//       }).toList();

//       setState(() {
//         billList = loadedBillDetails;
        
//       });
//     }
    
//   }

//   String getBillDate(String billNo) {
//     final billMaster = billMasters.firstWhere(
//       (bm) => bm.billNo == billNo,
//       orElse: () => BillMaster(
//         billNo: billNo,
//         billDate: "",
//         totalBillAmount: 0,
//         gstAmount: 0,
//         netPayableAmount: 0,
//         userName: '',
//       ),
//     );

//     return billMaster.billDate;
//   }



//   @override
//   Widget build(BuildContext context) {
//     filteredList = billList.where((bill) {
//       final String searchvalue = searchController.text.toLowerCase();
//       return bill.medicineName.toLowerCase().contains(searchvalue) ||
//           bill.quantity.toString().contains(searchvalue) ||
//           bill.unitPrice.toString().contains(searchvalue) ||
//           bill.billNo.contains(searchvalue) ||
//           getBillDate(bill.billNo).contains(searchvalue);
//     }).toList();

//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(
//             children: [
//                SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               Text("Sales Report",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
//                  ExpansionTile(
//               title: Text('Search'),
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(25.0),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: fromController,
//                         readOnly: true,
//                         decoration: InputDecoration(
//                           suffixIcon: InkWell(
//                             splashColor: Colors.transparent,
//                             onTap: () {
//                               selectDate(context, fromController);
//                             },
//                             child: Icon(
//                               Icons.calendar_month_rounded,
//                             ),
//                           ),
//                           errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           labelText: 'Enter From Date',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       TextFormField(
//                         controller: toController,
//                         readOnly: true,
//                         decoration: InputDecoration(
//                           suffixIcon: InkWell(
//                               splashColor: Colors.transparent,
//                               onTap: () {
//                                 selectDate(context, toController);
//                               },
//                               child: Icon(
//                                 Icons.calendar_month_rounded,
//                               )),
//                           errorBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           labelText: 'Enter to Date',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                        filterSalesData();
//                        print("done");
//                           setState(() {});

//                         },
//                         child: Text('Search'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
             
//               SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//               ),
           
             
//  TextField(
//                       controller: searchController,
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white70,
//                         hintText: 'Search',
//                         hintStyle: TextStyle(color: Colors.grey),
//                         suffixIcon: Icon(Icons.search),
//                       ),
//                     ),

//                       if (filteredList.isEmpty)
//                      Column(
                 
//                        children: [
//                         SizedBox(height: 40.0,),
//                          Text(
                          
//                                          'No data found',
//                                            style: TextStyle(fontSize: 16, color: Colors.red),
//                                      ),
//                        ],
//                      ),
//             if (filteredList.isNotEmpty) 
//               Expanded(
          
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       DataTable(
//                         columnSpacing: 3,
//                         columns: <DataColumn>[
//                           DataColumn(label: Text('Bill Date')),
//                           DataColumn(label: Text('Med Name')),
//                           DataColumn(label: Text('Qnty')),
//                           DataColumn(label: Text('U Price')),
//                           DataColumn(label: Text('Amount')),
//                           DataColumn(label: Text('BillNo')),
//                         ],
//                         rows: filteredList.map((bill) {
//                           return DataRow(
//                             cells: <DataCell>[
//                               DataCell(Text(getBillDate(bill.billNo))),
//                               DataCell(Text(bill.medicineName)),
//                               DataCell(Text(bill.quantity.toString())),
//                               DataCell(Text(bill.unitPrice.toStringAsFixed(2))),
//                               DataCell(Text(bill.amount.toStringAsFixed(2))),
//                               DataCell(Text(bill.billNo)),
//                             ],
//                           );
//                         }).toList(),
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











