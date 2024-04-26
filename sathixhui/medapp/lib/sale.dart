import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';
import 'package:shared_preferences/shared_preferences.dart';

// // Assume BillMaster and BillDetail classes are defined as in the previous code

// class Sale extends StatefulWidget {
//   const Sale({Key? key}) : super(key: key);

//   @override
//   State<Sale> createState() => _SaleState();
// }

// class _SaleState extends State<Sale> {




//   DateTime? fromDate;
//   DateTime? toDate;
//   List<BillMaster> billMasters = []; // List of BillMaster instances
//   List<BillDetail> billDetails = []; // List of BillDetail instances

// fetch()async{
//     final prefs = await SharedPreferences.getInstance();
//     final savedBillList = prefs.getStringList('billDetails');
//     final savedBillMasters = prefs.getString('billMasters');
// }


//   List<BillDetail> getFilteredBillDetails() {
//     List<BillDetail> filteredBills = [];

//     if (fromDate != null && toDate != null) {
//       for (var master in billMasters) {
//         DateTime billDate = DateTime.parse(master.billDate);

//         if (billDate.isAfter(fromDate!.subtract(Duration(days: 1))) &&
//             billDate.isBefore(toDate!.add(Duration(days: 1)))) {
//           String billNo = master.billNo;

//           for (var detail in billDetails) {
//             if (detail.billNo == billNo) {
//               filteredBills.add(detail);
//             }
//           }
//         }
//       }
//     }

//     return filteredBills;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bill Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Select From Date:'),
//             ElevatedButton(
//               onPressed: () async {
//                 final DateTime? picked = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2020),
//                   lastDate: DateTime(2025),
//                 );
//                 if (picked != null && picked != fromDate) {
//                   setState(() {
//                     fromDate = picked;
//                   });
//                 }
//               },
//               child: Text(fromDate != null ? 'From: ${fromDate.toString()}' : 'Select From Date'),
//             ),
//             SizedBox(height: 20),
//             Text('Select To Date:'),
//             ElevatedButton(
//               onPressed: () async {
//                 final DateTime? picked = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2020),
//                   lastDate: DateTime(2025),
//                 );
//                 if (picked != null && picked != toDate) {
//                   setState(() {
//                     toDate = picked;
//                   });
//                 }
//               },
//               child: Text(toDate != null ? 'To: ${toDate.toString()}' : 'Select To Date'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 List<BillDetail> filteredBills = getFilteredBillDetails();
//                 if (filteredBills.isNotEmpty) {
//                   for (var bill in filteredBills) {
//                     print('Medicine: ${bill.medicineName}');
//                     print('Quantity: ${bill.quantity}');
//                     print('Price: ${bill.unitPrice}');
//                     print('--------------------------------');
//                   }
//                 } else {
//                   print('No bills found for the selected date range.');
//                 }
//               },
//               child: Text('Search Bills'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }














class Sale extends StatefulWidget {
  const Sale({Key? key}) : super(key: key);

  @override
  State<Sale> createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  DateTime? fromDate;
  DateTime? toDate;
  List<BillMaster> billMasters = [];
  List<BillDetail> billDetails = [];

  @override
  void initState() {
    super.initState();
    fetchFromSharedPref(); // Fetch data when the widget initializes
  }

  fetchFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

    final String? savedBillMasters = prefs.getString('billMasters');
    if (savedBillMasters != null) {
      final List<dynamic> billMastersJson = await parseString(savedBillMasters);
      billMasters = billMastersJson.map((json) => BillMaster.fromJson(json)).toList();
    }

    final List<String>? savedBillDetails = prefs.getStringList('billDetails');
    if (savedBillDetails != null) {
      billDetails = savedBillDetails.map((detail) => BillDetail.fromJson(parseString(detail))).toList();
    }
  }

  dynamic parseString(String jsonString) {
    // This function depends on how your data is structured in SharedPreferences.
    // For example, if your data is stored as JSON strings, you can parse them here.
    // Below is an example, but adjust this based on your actual data structure.

    return {}; // Implement your logic to parse JSON strings
  }

  List<BillDetail> getFilteredBillDetails() {
    List<BillDetail> filteredBills = [];

    if (fromDate != null && toDate != null) {
      for (var master in billMasters) {
        DateTime billDate = DateTime.parse(master.billDate);

        if (billDate.isAfter(fromDate!.subtract(Duration(days: 1))) &&
            billDate.isBefore(toDate!.add(Duration(days: 1)))) {
          String billNo = master.billNo;

          for (var detail in billDetails) {
            if (detail.billNo == billNo) {
              filteredBills.add(detail);
            }
          }
        }
      }
    }

    return filteredBills;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text('Select From Date:'),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                );
                if (picked != null && picked != fromDate) {
                  setState(() {
                    fromDate = picked;
                  });
                }
              },
              child: Text(fromDate != null ? 'From: ${fromDate.toString()}' : 'Select From Date'),
            ),
            SizedBox(height: 20),
            Text('Select To Date:'),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                );
                if (picked != null && picked != toDate) {
                  setState(() {
                    toDate = picked;
                  });
                }
              },
              child: Text(toDate != null ? 'To: ${toDate.toString()}' : 'Select To Date'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                List<BillDetail> filteredBills = getFilteredBillDetails();
                if (filteredBills.isNotEmpty) {
                  for (var bill in filteredBills) {
                    print('Medicine: ${bill.medicineName}');
                    print('Quantity: ${bill.quantity}');
                    print('Price: ${bill.unitPrice}');
                    print('--------------------------------');
                  }
                } else {
                  print('No bills found for the selected date range.');
                }
              },
              child: Text('Search Bills'),
            ),
          ],
        ),
      ),
    );
  }
}
