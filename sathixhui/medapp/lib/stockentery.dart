
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medapp/dats.dart';
import 'package:medapp/widget/billerwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StockEntry extends StatefulWidget {
  const StockEntry({Key? key});

  @override
  State<StockEntry> createState() => _StockEntryState();
}

class _StockEntryState extends State<StockEntry> {
  bool isDropdownExpanded = false;
  String? selectedDropdownValue;
  String? selectedBrand;
  double quantity = 0;
  double unitPrice = 0;
  String newMedicineName = "";
  String newBrand = "";
  SharedPreferences? sref;

  @override
  void initState() {
    super.initState();
    fetchData();
    SharedPreferences.getInstance().then((prefs) {
      sref = prefs;
    });
  }

  fetchData() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    List<String>? stockData = sref.getStringList('stockData');
    List<String>? medicineMasterData = sref.getStringList('medicineMasterData');
    if (stockData != null) {
      stock.clear();
      stock.addAll(stockData.map((item) => StockItem.fromJson(jsonDecode(item))));
    }

    if (medicineMasterData != null) {
      medicineMaster.clear();
      medicineMaster.addAll(medicineMasterData.map((item) => MedicineMaster.fromJson(jsonDecode(item))));
    }

    setState(() {});
  }

  refilshare() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    if (selectedDropdownValue != null) {
      StockItem selectedItem = stock.firstWhere((item) => item.medicinename == selectedDropdownValue);

      selectedItem.quantity += quantity;
      selectedItem.unitprice = unitPrice;

      List stockData = stock.map((item) => item.toJson()).toList();
      sref.setStringList('stockData', stockData.map((item) => jsonEncode(item)).toList());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Stock refilled successfully!'),
        ),
      );

      Navigator.pop(context);
    }
  }

  refilStock(BuildContext context) {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width * 0.80,
              child: ListView(
                children: [
                  AppBar(
                    title: Text('Refill Stock'),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: selectedDropdownValue,
                            onChanged: (newValue) {
                              setState(() {
                                isDropdownExpanded = true;
                                selectedDropdownValue = newValue;
                                MedicineMaster selectedMedicine =
                                    medicineMaster.firstWhere((e) => e.medicineName == newValue);
                                selectedBrand = selectedMedicine.brand;
                              });
                            },
                            items: stock.map<DropdownMenuItem<String>>((item) {
                              return DropdownMenuItem<String>(
                                value: item.medicinename,
                                child: Text(
                                  item.medicinename,
                                  style: TextStyle(color: Colors.greenAccent, fontSize: 20.0),
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
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Brand',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  ),
                                  controller: TextEditingController(text: selectedBrand ?? ''),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Quantity',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  ),
                                  controller: TextEditingController(text: ''),
                                  onChanged: (value) {
                                    quantity = double.tryParse(value) ?? 0;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Unit Price',
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  ),
                                  controller: TextEditingController(text: ''),
                                  onChanged: (value) {
                                    unitPrice = double.tryParse(value) ?? 0;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                                ElevatedButton(
                                  onPressed: () {
                                    refilshare();
                                  },
                                  child: Text("Update"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  addsNewStock() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    if (newMedicineName.isNotEmpty && newBrand.isNotEmpty) {
      if (stock.any((element) => element.medicinename==newMedicineName)) {
        scafWidgets(context, smsg: "allredy exists", coolors: Colors.red
        );
       
      
      }
       else{
          
        
      Map<String, dynamic> newMedicineData = {
        'medicineName': newMedicineName,
        'brand': newBrand,
      };
      List<String> medicineDataList = sref.getStringList('medicineDataList') ?? [];
      medicineDataList.add(jsonEncode(newMedicineData));
      sref.setStringList('medicineDataList', medicineDataList);
      stock.add(StockItem(medicinename: newMedicineName));
      medicineMaster.add(MedicineMaster(medicineName: newMedicineName, brand: newBrand));

     
      sref.setStringList(
          'medicineMasterData', medicineMaster.map((item) => jsonEncode(item.toJson())).toList());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medicine added successfully!'),
        ),
      );
      Navigator.pop(context);
    }
    setState(() {});
  }
  }


  addStock(BuildContext context) {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.70,
            child: ListView(
              children: [
                AppBar(
                  title: Text('Add Stock'),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.height * 0.40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Medicine Name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                          onChanged: (value) {
                            newMedicineName = value;
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Brand',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                          ),
                          onChanged: (value) {
                            newBrand = value;
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        ElevatedButton(
                          onPressed: () async {
                            addsNewStock();
                          },
                          child: Text("ADD"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("StockEntry",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              SizedBox(
height: MediaQuery.of(context).size.height*0.05,
              ),
               Container(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.width * 0.70,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      addStock(context);
                    },
                    child: Text("Add New Stock"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      refilStock(context);
                    },
                    child: Text("Refill Stock"),
                  ),
                ],
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
