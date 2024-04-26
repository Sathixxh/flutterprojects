import 'package:flutter/material.dart';



import 'package:medapp/dats.dart';
import 'package:medapp/login.dart';
import 'package:medapp/stockentery.dart';
import 'package:medapp/stockviewdone.dart';

import 'package:medapp/widget/sadminwidget.dart';

//import 'new.dart';

class Inventry extends StatefulWidget {
  final User user;

  Inventry({required this.user});

  @override
  _InventryState createState() => _InventryState(user: user);
}

class _InventryState extends State<Inventry> {
  final User user;

  _InventryState({required this.user});

  String selectedItem = 'Dashboard';
   var bodyContent;

  void _navigateToPage(String pageName) {
    selectedItem = pageName;
    print('Navigating to: $pageName');

    Navigator.of(context).pop(); 
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedItem);
    final drawerItems = getDrawerItems(user.roleId);
    // print(drawerItems);
 
   
    switch (selectedItem) {
      case 'Dashboard':
        bodyContent = syAdmindash(context, );
        break;
      case 'Stock Entry':
        bodyContent = StockEntry();
        break;
      case 'Stock View':
        bodyContent =StockView();
     case 'Logout':
        bodyContent = logout(context, user.userName);
        break;
        
      default:
        bodyContent = syAdmindash(context,);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MedApp'),
        centerTitle: true,
        
      ),
      drawer: Drawer(
        width: 270.0,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Symbol_from_Marvel%27s_The_Avengers_logo.svg/1754px-Symbol_from_Marvel%27s_The_Avengers_logo.svg.png"),
                  ),
                   SizedBox(height: 20.0),
                  Text(user.userName),
                ],
              ),
            ),
            Container(
              
  height: MediaQuery.of(context).size.height * 0.50,
  child: ListView(
    children: drawerItems
        .map((item) => Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateToPage(item);
              },
              child: ListTile(
                title: Text(item,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
              ),
            ),
             Divider(height: 1.5,color: Colors.black,),
          ],
        ))
        .toList(),
  ),
)
          ],
        ),
      ),
      body: bodyContent, // Set the body content based on the selected item
    );
  }

}
