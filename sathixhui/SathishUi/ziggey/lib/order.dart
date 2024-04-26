import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onboardscreen/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late Future<List<Map<String, dynamic>>> _orderItemsFuture;

  @override
  void initState() {
    super.initState();
    _orderItemsFuture = getOrderItems();
  }

  Future<List<Map<String, dynamic>>> getOrderItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? orderItems = prefs.getStringList('orderItems') ?? <String>[];
    List<Map<String, dynamic>> decodedItems = orderItems
        .map((orderItem) => jsonDecode(orderItem) as Map<String, dynamic>)
        .toList();
    return decodedItems;
  }

  Future<void> removeOrderItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? orderItems = prefs.getStringList('orderItems') ?? <String>[];
    orderItems.removeAt(index);
    await prefs.setStringList('orderItems', orderItems);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      
      
      
      
      
      
      
      
      
       FutureBuilder(
        future: _orderItemsFuture,
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(child: Text('Error loading data'));
          }
          List<Map<String, dynamic>> orderItems = snapshot.data!;
          return ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> item = orderItems[index];
              return Container(
                height: 150,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    item['image_url'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item["name"],
                                    style: const TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '\$Price ${item['price'].toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '\Delivery With in :${item['delivery_time']}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 99, 98, 98)),
                                  ),
                                  SizedBox(height: 5),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              primaryColor),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      await removeOrderItem(index);
                                      setState(() {
                                        _orderItemsFuture = getOrderItems();
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text('Order cancelled')),
                                      );
                                    },
                                    child: const Text(
                                      "Cancel Order",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
