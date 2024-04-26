import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SalesReportState createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  List? fetchSave;
  List<Map<String, dynamic>> mergedList = [];
  List<Map<String, dynamic>> filteredMergedList = [];
  List<BillDetail> billList = [];
  List<BillMaster> billMasters = [];
  DateTime fromDate = DateTime.now();
  List<BillDetail> filteredList = [];
  DateTime toDate = DateTime.now();
  List<BillMaster> filteredBillMaster = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    retrieveBillList();

    setState(() {});
  }

  void filterByDate() {
    String fromDate = (fromController.text);
    String toDate = (toController.text);

    filteredMergedList = mergedList.where((bill) {
      String billDate = (bill['billDate']);
      return billDate.compareTo(fromDate) >= 0 &&
          billDate.compareTo(toDate) <= 0;
    }).toList();

    setState(() {});
  }


void filterBySearch(String input) {
  if (input.isEmpty) {
    setState(() {
      filteredMergedList = mergedList;
    });
  } else {
    setState(() {
      filteredMergedList = mergedList
          .where((bill) =>
               
              
              
                bill['medicineName'].toString().toLowerCase().contains(input.toLowerCase()) ||
              bill['billNo'].toString().toLowerCase().contains(input.toLowerCase()) ||
                    bill['quantity'].toString().toLowerCase().contains(input.toLowerCase()) ||
              bill['amount'].toString().toLowerCase().contains(input.toLowerCase()) ||
               bill['unitPrice'].toString().toLowerCase().contains(input.toLowerCase()) ||
              bill['billDate'].toString().toLowerCase().contains(input.toLowerCase())) 
        
              
          .toList();
    });
  }
}

  Future<void> selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  retrieveBillList() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBillList = prefs.getStringList('billDetails');
    final savedBillMasters = prefs.getString('billMasters');
    fetchSave = jsonDecode(savedBillMasters!);

    
      final List<dynamic> billMastersJson = jsonDecode(savedBillMasters);
      billMasters =
          billMastersJson.map((data) => BillMaster.fromJson(data)).toList();
    

    if (savedBillList != null) {
      final loadedBillDetails = savedBillList.map((billString) {
        final parts = billString.split(', ');
        return BillDetail(
          medicineName: parts[0],
          quantity: int.parse(parts[1]),
          unitPrice: double.parse(parts[2]),
          amount: double.parse(parts[3]),
          billNo: parts[4],
        );
      }).toList();

      setState(() {
        billList = loadedBillDetails;
      });
    }
    if (billMasters.isNotEmpty && billList.isNotEmpty) {
      for (var bill in billList) {
        Map<String, dynamic> mergedData = {
          'billNo': bill.billNo,
          'medicineName': bill.medicineName,
          'quantity': bill.quantity,
          'unitPrice': bill.unitPrice,
          'amount': bill.amount,
          'billDate': getBillDate(bill.billNo),
        };
        mergedList.add(mergedData);
      }

      setState(() {
        filteredMergedList = mergedList;
      
      });
    }
  }

  String getBillDate(String billNo) {
    final billMaster = billMasters.firstWhere(
      (bm) => bm.billNo == billNo,
      orElse: () => BillMaster(
        billNo: billNo,
        billDate: "",
        totalBillAmount: 0,
        gstAmount: 0,
        netPayableAmount: 0,
        userName: '',
      ),
    );

    return billMaster.billDate;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            const  Text("Sales Report",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent)),
              ExpansionTile(
                
                title: const Text('Searching with Date'),
                children: [
                  Padding(
                    padding:const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fromController,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                selectDate(fromController);
                              },
                              child:const Icon(
                                Icons.calendar_month_rounded,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Enter From Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: toController,
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  selectDate(toController);
                                },
                                child: const Icon(
                                  Icons.calendar_month_rounded,
                                )),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Enter to Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              filterByDate();
                            });
                          },
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  filterBySearch(value);
                  setState(() {});
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
        
             
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columnSpacing: 14,
                      columns: const <DataColumn>[
                        DataColumn(label: Text('BillDate')),
                        DataColumn(label: Text('BillNo')),
                        DataColumn(label: Text('Med Name')),
                        DataColumn(label: Text('Qnty')),
                      
                        DataColumn(label: Text('Amount')),
                      ],
                      rows: 
                      
                      
                      
                      filteredMergedList.map((bill) {
                        return DataRow(
                          cells: [
                            DataCell(Text(bill['billDate'])),
                            DataCell(Text(bill['billNo'].toString())),
                            DataCell(Text(bill['medicineName'])),
                            DataCell(Text(bill['quantity'].toString())),
                        
                            DataCell(Text(bill['amount'].toString())),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}  

















