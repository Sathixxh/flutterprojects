// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'package:flutter/material.dart';

class MyRev extends StatefulWidget {

  const MyRev({super.key});
  @override
  State<MyRev> createState() => _MyRevState();
}


class _MyRevState extends State<MyRev>{
  @override
 
 Widget build(BuildContext Context){
return SafeArea(child: Scaffold(
appBar: AppBar(

  actions: [],
  flexibleSpace: FlexibleSpaceBar(
  
  title: Text("data"),
  //centerTitle: true,

  ),
),
drawer: Drawer(
  child: ListView(
    
    children: [
     
    ],
  ),
 

),
body: ListView(
children: [

],

),

));
}
}