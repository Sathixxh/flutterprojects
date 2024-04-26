//ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';
import 'package:medapp/widget/billerwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillEntryScreen extends StatefulWidget {
  final String? currentuser;

  const BillEntryScreen({super.key, required this.currentuser});
  @override
  _BillEntryScreenState createState() => _BillEntryScreenState();
}

class _BillEntryScreenState extends State<BillEntryScreen> {
  final form1 = GlobalKey<FormState>();
  List<BillDetail> billDetails = [];
  double todaysale = 0.0;
  String generatedBillNo = "";
  double totalBillAmount = 0.0;
  double gstAmount = 0.0;
  double netPayableAmount = 0.0;
  String? selectedDropdownValue;
  TextEditingController quantityController = TextEditingController();
  bool isDropdownExpanded = false;
  SharedPreferences? prefs;
  List<BillMaster> billMasters = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    loadBillDetails();
    addItemToBill();

    setState(() {});
  }

  Future<void> fetchData() async {
    prefs = await SharedPreferences.getInstance();
    loadBillDetails();
  }

  void saveBillDetails() async {
    if (prefs == null) {
      return;
    }

    final List<BillDetail> nonDefaultBillDetails =
        billDetails.where((billDetail) {
      return billDetail.medicineName.isNotEmpty;
    }).toList();

    final billList = nonDefaultBillDetails.map((billDetail) {
      return "${billDetail.medicineName}, ${billDetail.quantity}, ${billDetail.unitPrice}, ${billDetail.amount}, ${billDetail.billNo}";
    }).toList();

    if (nonDefaultBillDetails.isNotEmpty) {
      await prefs!.setStringList('billDetails', billList);

      final BillMaster billEntry = BillMaster(
        billNo: generatedBillNo,
        billDate: DateTime.now().toString().split(' ')[0],
        totalBillAmount: totalBillAmount,
        gstAmount: gstAmount,
        netPayableAmount: netPayableAmount,
        userName: widget.currentuser!,
      );

      billMasters.add(billEntry);
    } else {
      await prefs!.remove('billDetails');
    }

    final billMastersJson =
        jsonEncode(billMasters.map((bill) => bill.toJson()).toList());
    await prefs!.setString('billMasters', billMastersJson);

    setState(() {});
    loadBillDetails();
  }

  void loadBillDetails() async {
    if (prefs == null) {
      return;
    }

    final savedBillList = prefs!.getStringList('billDetails');
    final savedBillMasters = prefs!.getString('billMasters');

    if (savedBillMasters != null) {
      final List<dynamic> billMastersJson = jsonDecode(savedBillMasters);
      billMasters =
          billMastersJson.map((data) => BillMaster.fromJson(data)).toList();

      final today = DateTime.now().toString().split(' ')[0];
      todaysale = billMasters
          .where((billMaster) => billMaster.billDate == today)
          .fold<double>(
              0.0, (total, billMaster) => total + billMaster.totalBillAmount);
    }

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
        billDetails = loadedBillDetails;

        updateTodaySale();
      });
    }
  }

  void updateStockQuantity() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    List<String> stockData =
        stock.map((item) => jsonEncode(item.toJson())).toList();
    sref.setStringList('stockData', stockData);
  }

  void generateRandomBillNo() {
    if (generatedBillNo.isEmpty) {
      final Random random = Random();
      generatedBillNo = (1000 + random.nextInt(9000)).toString();
    }
  }

  void updateBillTotals() {
    totalBillAmount =
        billDetails.fold(0, (total, detail) => total + detail.amount);
    gstAmount = totalBillAmount * 0.18;
    netPayableAmount = totalBillAmount + gstAmount;
  }

  void updateTodaySale() {
    final today = DateTime.now().toString().split(' ')[0];
    todaysale = billDetails
        .where((billDetail) => billDetail.billNo == today)
        .fold<double>(0.0, (total, billDetail) => total + billDetail.amount);
  }

  void preview(BuildContext context) {
    double newTotalAmount = newbillDetails.fold<double>(
        0, (total, detail) => total + detail.amount);
    double newGSTAmount = newTotalAmount * 0.18;
    double newNetPayableAmount = newTotalAmount + newGSTAmount;

    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.70,
            child: ListView(
              children: [
                AppBar(
                  title: const Text('Preview'),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 5,
                    columns: const [
                      DataColumn(label: Text('Medicine')),
                      DataColumn(label: Text('Quantity')),
                      DataColumn(label: Text('Unit Price')),
                      DataColumn(label: Text('total')),
                    ],
                    rows: newbillDetails.map((item) {
                      return DataRow(cells: [
                        DataCell(Text(item.medicineName)),
                        DataCell(Text(item.quantity.toString())),
                        DataCell(Text(item.unitPrice.toString())),
                        DataCell(Text(item.amount.toString())),
                      ]);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Text("Total Amount: $newTotalAmount"),
                    Text("GST (18%): ${newGSTAmount.toStringAsFixed(2)}"),
                    Text("Net Amount: $newNetPayableAmount"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool addquanity = false;

  List newbillDetails = [];

  void addItemToBill() {
    if (selectedDropdownValue != null && quantityController.text.isNotEmpty) {
      final int quantity = int.parse(quantityController.text);
      final StockItem selectedStockItem = stock.firstWhere(
        (item) => item.medicinename == selectedDropdownValue,
        orElse: () => StockItem(medicinename: selectedDropdownValue!),
      );

      if (quantity > 0 && selectedStockItem.quantity >= quantity) {
        addquanity = true;
        generateRandomBillNo();
        final double unitPrice = selectedStockItem.unitprice;
        double amount = unitPrice * quantity;
        BillDetail item = BillDetail(
          medicineName: selectedDropdownValue!,
          quantity: quantity,
          unitPrice: unitPrice,
          amount: amount,
          billNo: generatedBillNo,
        );

        setState(() {
          billDetails.add(item);
          totalBillAmount += amount;
          gstAmount = totalBillAmount * 0.18;
          netPayableAmount = totalBillAmount + gstAmount;
          todaysale = totalBillAmount;
          quantityController.clear();
          newbillDetails.add(item);
        });

        if (selectedStockItem != null) {
          if (quantity <= selectedStockItem.quantity) {
            selectedStockItem.quantity -= quantity;
          } else {
            scafWidgets(context,
                smsg: "insufficient stock", coolors: Colors.red);
            return;
          }
        }
      } else {
        scafWidgets(context,
            smsg: quantity < selectedStockItem.quantity
                ? "Invalid Quantity. Quantity should be greater than 0"
                : "Insufficient Quantity in Stock for $selectedDropdownValue",
            coolors: Colors.red);
      }
    }
  }

  Future<void> saveBill() async {
    //  final String currentUser;
    final List<BillDetail> newBillDetails = List.from(billDetails);
    final Map<String, int> quantityToReduce = {};

    for (var billDetail in newBillDetails) {
      final String medicineName = billDetail.medicineName;
      final int quantity = billDetail.quantity;
      quantityToReduce[medicineName] =
          quantityToReduce.containsKey(medicineName)
              ? quantityToReduce[medicineName]! + quantity
              : quantity;
    }
    for (var entry in quantityToReduce.entries) {
      final String medicineName = entry.key;
      final int quantity = entry.value;

      final StockItem selectedStockItem = stock.firstWhere(
        (item) => item.medicinename == medicineName,
        orElse: () => StockItem(medicinename: medicineName),
      );
    }

    final BillMaster billEntry = BillMaster(
      billNo: generatedBillNo,
      billDate: DateTime.now().toString().split(' ')[0],
      totalBillAmount: totalBillAmount,
      gstAmount: gstAmount,
      netPayableAmount: netPayableAmount,
      userName: widget.currentuser!,
    );

    billMasters.add(billEntry);

    generatedBillNo = '';

    newbillDetails.clear();
    totalBillAmount = 0.0;
    gstAmount = 0.0;
    netPayableAmount = 0.0;
    saveBillDetails();
    updateStockQuantity();
    updateTodaySale();
    setState(() {});
    scafWidgets(context, smsg: "Bill saved sucessfully", coolors: Colors.green);
  }

  String getAvailableQuantity(String? selectedMedicine) {
    if (selectedMedicine != null) {
      StockItem? selectedStockItem = stock.firstWhere(
        (item) => item.medicinename == selectedMedicine,
        orElse: () => StockItem(medicinename: selectedMedicine),
      );
      if (selectedStockItem != null) {
        return 'Available Quantity: ${selectedStockItem.quantity}';
      }
    }
    return '';
  }

  String selectedMedicine = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                "BILL ENTRY",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              DropdownButtonFormField<String>(
                value: selectedDropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedDropdownValue = newValue;
                    isDropdownExpanded = true;
                    if (selectedMedicine != selectedDropdownValue) {
                      selectedMedicine = selectedDropdownValue!;
                      quantityController.text = "";
                    }
                  });
                },
                items: stock.map<DropdownMenuItem<String>>((item) {
                  return DropdownMenuItem<String>(
                    value: item.medicinename,
                    child: Text(
                      item.medicinename,
                      style: const TextStyle(
                          color: Colors.greenAccent, fontSize: 20.0),
                    ),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Medicine Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Visibility(
                visible: isDropdownExpanded,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Form(
                      key: form1,
                      child: TextFormField(
                        controller: quantityController,
                        decoration: InputDecoration(
                            labelText: 'No of quantity',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: getAvailableQuantity(selectedMedicine)),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 240, 33, 33)),
                      ),
                      onPressed: () {
                        preview(context);
                      },
                      child: const Text('Preview'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (form1.currentState!.validate()) {
                              addItemToBill();
                            }
                          },
                          child: const Text('Add'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 60, 162, 64)),
                          ),
                          onPressed: () {
                            if (form1.currentState!.validate()) {
                              if (addquanity) {
                                saveBill();
                              }
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                color: Colors.black12,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text("Bill Details:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columnSpacing: 5,
                        columns: const [
                          DataColumn(
                            label: Text('MedName'),
                          ),
                          DataColumn(label: Text('Qua')),
                          DataColumn(label: Text('BilNo')),
                          DataColumn(label: Text('BilDate')),
                          DataColumn(label: Text('TotalAmt')),
                          DataColumn(label: Text('GST(18%)')),
                          DataColumn(label: Text('NetAmount')),
                        ],
                        rows: newbillDetails.map((item) {
                          return DataRow(cells: [
                            DataCell(Text(item.medicineName)),
                            DataCell(Text(item.quantity.toString())),
                            DataCell(Text(item.billNo)),
                            DataCell(
                                Text(DateTime.now().toString().split(' ')[0])),
                            DataCell(Text(item.amount.toString())),
                            DataCell(Text((item.amount * 0.18).toString())),
                            DataCell(Text(((item.amount) + (item.amount * 0.18))
                                .toString())),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
