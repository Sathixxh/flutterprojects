
import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class StockView extends StatefulWidget {
  const StockView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StockViewState createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  TextEditingController searchController = TextEditingController();
  List<StockItem> filteredStock = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(filterStock);
    fetchData();
  }
  void showMedicineDetails(StockItem selectedMedicine) {
    
    MedicineDetails? details = medicineDetails.firstWhere(
      (detail) => detail.medicinename == selectedMedicine.medicinename,
     
    );

    // ignore: unnecessary_null_comparison
    if (details != null) {
      showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              backgroundColor: const Color.fromARGB(255, 138, 202, 140),
              title: const Text("Medicine Details",style: TextStyle(color: Colors.blue,fontSize: 20.0),),
              
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text("Medicnename: ${details.medicinename}"),
                  Text("Precaution: ${details.precaution}"),
                  Text("Usage: ${details.usage}"),
                  Text("Manufacturing Date: ${details.manufacturingDate}"),
                  Text("Expiry Date: ${details.expiryDate}"),
                  Text("Dosage: ${details.dosage}"),
                  const SizedBox(height: 20.0,),
    Center(
      child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
    ),

                ],
              ),
              
            
              
            ),
          );
        },
      );
    }
  }
  void fetchData() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    List<String>? stockData = sref.getStringList('stockData');

    if (stockData != null) {
      stock.clear();
      stock.addAll(stockData.map((item) => StockItem.fromJson(jsonDecode(item))));
    }
    updateStockQuantity();
    filterStock();
  }

  void updateStockQuantity() async{
    
    SharedPreferences sref = await SharedPreferences.getInstance();
    List<String> stockData = stock.map((item) => jsonEncode(item.toJson())).toList();
    sref.setStringList('stockData', stockData);
  }



void filterStock() {
  final query = searchController.text.toLowerCase();
  setState(() {
    if (query.isNotEmpty) {
      filteredStock = stock
          .where((item) =>
              item.medicinename.toLowerCase().contains(query) ||
              
              item.quantity.toString().contains(query) ||
              item.unitprice.toString().contains(query))
          .toList();
    } else {
      filteredStock = List.from(stock);
    }
  });
}



  String findBrandName(String medicineName) {
    final medicine = medicineMaster.firstWhere(
        (item) => item.medicineName == medicineName,
        orElse: () => MedicineMaster(medicineName: medicineName, brand: 'Unknown'));
    return medicine.brand;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Text(
            "StockView",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredStock.length,
              itemBuilder: (BuildContext context, int index) {
                final stockItem = filteredStock[index];
                final brandName = findBrandName(stockItem.medicinename);
                return ListTile(
               
                  title: Text("Medicine: ${stockItem.medicinename}"),
                  subtitle: Text("Brand: $brandName"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                 
                    children: [
                      Text("Quantity: ${stockItem.quantity}"),
                         Text("unitprice: ${stockItem.unitprice}"),
                    ],
                  ),
                      onTap: () {
                    showMedicineDetails(stockItem);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}