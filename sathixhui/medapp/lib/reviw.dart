import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder"),
      leading: Icon(Icons.abc),
      actions: [
    Icon(Icons.ac_unit),
    Icon(Icons.ac_unit),
      ],
      ),
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Center(
  child: Column(
    children: [
       FloatingActionButton(onPressed: (){
  
      setState(() {
        Text("111111111111");
      });
    },
       child : Text("data")
    
    ),
    TextButton(onPressed: (){}, child: Text("1111")),
    MaterialButton(onPressed: (){
  
    },child: Text("data222222222"),),
  ElevatedButton(
    onPressed: () {
      // Add your desired functionality here
      print('Customized ElevatedButton pressed');
    },
    child: Text('Custom Button'),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange), // Change button color
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.white)), // Change text color
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(15.0)), // Change padding
      // Add more styles as needed
    ),
  ),
  InkWell(
    onTap: () {
      print("inkwell");
    },
    child:   Text("jiiiii"
    ),
  ),GestureDetector(
    onTap: () {
      print("gesture");
    },
    child: Text("dat44444444444a")),
    Container(
  
  
      child: Card(
        color: Colors.red,
         child: Text("ca           rd"),
   ),
       
      
      ),
      TextField(
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0)
        ), labelText: "Enter Your Name", hintText: "Name"),
        
      ),TextFormField(
        initialValue: 'Rohit',
        decoration: InputDecoration(labelText: "Your name"),
        )

      
    
  
  
    ],
  ),
  ),
),
 
    );
  }
}