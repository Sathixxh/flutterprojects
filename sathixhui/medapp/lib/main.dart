import 'package:flutter/material.dart';

import 'package:medapp/login.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      title: 'MedApp Demo',
       home: LoginPage(),
      // home: MyWidget(),
    


    );
  }}
























































































































