import 'package:flutter/material.dart';
import 'package:houseui/sc1.dart';
import 'package:houseui/screen2.dart';
import 'package:houseui/screen3.dart';


String screen1 = 's1';
String screen2 = 's2';
String screen3 = 's3';

Route<dynamic> controller(RouteSettings settings){
  switch (settings.name) {
    case 's1':
    return MaterialPageRoute(builder: (context) => Sc1(),); 
        case 's2':
    return MaterialPageRoute(builder: (context) => Screen2(),); 
    case 's3':
    return MaterialPageRoute(builder: (context) => Screen3(),); 

    default: throw 'file not found';
  }
}