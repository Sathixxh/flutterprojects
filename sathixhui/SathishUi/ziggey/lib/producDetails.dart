// import 'package:flutter/material.dart';
// import 'package:onboardscreen/utils.dart';

// class ProductDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> item;

//   const ProductDetailsPage({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10, left: 10),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios_new_outlined,
//                       color: Colors.white),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 Text(
//                   'Product Details',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: 190,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(50.0),
//                             topLeft: Radius.circular(50.0)),
//                       ),
//                       width: 380,
//                       height: 500,
//                       child: Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 130),
//                               Text(
//                                 item["name"],
//                                 style: const TextStyle(
//                                     color: primaryColor,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               const SizedBox(height: 20),
//                               Text(item['description'],
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                       color: Color.fromARGB(255, 139, 139, 139),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400)),
//                               const SizedBox(height: 20),
//                               Text(
//                                 '\$${item['price'].toStringAsFixed(2)}',
//                                 style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.green),
//                               ),
//                               const SizedBox(
//                                 height: 30.0,
//                               ),
//                               ElevatedButton(
//                                   style: ButtonStyle(
//                                       tapTargetSize:
//                                           MaterialTapTargetSize.shrinkWrap,
//                                       backgroundColor:
//                                           const MaterialStatePropertyAll(
//                                               primaryColor),
//                                       shape: MaterialStatePropertyAll(
//                                           RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(20)))),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     "Add Favourite",
//                                     style: TextStyle(color: Colors.black),
//                                   )),
//                               const SizedBox(
//                                 height: 20.0,
//                               ),
//                               ElevatedButton(
//                                   style: ButtonStyle(
//                                       tapTargetSize:
//                                           MaterialTapTargetSize.shrinkWrap,
//                                       backgroundColor:
//                                           const MaterialStatePropertyAll(
//                                               primaryColor),
//                                       shape: MaterialStatePropertyAll(
//                                           RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(20)))),
//                                   onPressed: () {},
//                                   child: const Text(
//                                     "OrderNow",
//                                     style: TextStyle(color: Colors.black),
//                                   )),
//                             ]),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 90,
//                     top: 70,
//                     child: Container(
//                       width: 220,
//                       height: 220,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue,
//                       ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           item['image_url'],
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onboardscreen/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProductDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Product Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 250,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0)),
                      ),
                      width: 410,
                      height: 800,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 130),
                              Text(
                                item["name"],
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 20),
                              Text(item['description'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 139, 139, 139),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '\Ratings ${item['ratings'].toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    '\$Price ${item['price'].toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
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
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {
                                    // Call function to add to favorites
                                    addToFavorites(item);
                                  },
                                  child: const Text(
                                    "Add Favorite",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const SizedBox(
                                height: 20.0,
                              ),
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
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {
                                    // Call function to order
                                    showOrderBottomSheet(context, item);
                                  },
                                  child: const Text(
                                    "Order Now",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 110,
                    top: 120,
                    child: Container(
                      width: 220,
                      height: 220,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          item['image_url'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addToFavorites(Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteItems =
        prefs.getStringList('favoriteItems') ?? <String>[];
    favoriteItems.add(jsonEncode(item));
    prefs.setStringList('favoriteItems', favoriteItems);
  }

  void showOrderBottomSheet(BuildContext context, Map<String, dynamic> item) {
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 231, 231),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0)),
          ),
          height: 200,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '\Price :${item['price'].toStringAsFixed(2)}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 10),
              Text(
                '\Delivery With in :${item['delivery_time']}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 99, 98, 98)),
              ),
              SizedBox(height: 10),
              Text(
                '\$ Discount of product  :${item['discount']}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor:
                          const MaterialStatePropertyAll(primaryColor),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    // Add item to order list
                    addToOrderList(item);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        );
      },
    );
  }

  void addToOrderList(Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? orderItems = prefs.getStringList('orderItems') ?? <String>[];
    orderItems.add(jsonEncode(item));
    prefs.setStringList('orderItems', orderItems);
  }
}
