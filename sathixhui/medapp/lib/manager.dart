
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medapp/dashborad.dart';
import 'package:medapp/dats.dart';
import 'package:medapp/login.dart';
import 'package:medapp/salesreport.dart';
import 'package:medapp/stockentery.dart';
import 'package:medapp/stockviewdone.dart';
import 'package:medapp/widget/billerwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Manager extends StatefulWidget {
  final User user;
  final String roleid;
  final double todaysale;

  Manager({required this.user, required this.roleid, required this.todaysale});

  @override
  _ManagerState createState() =>
      _ManagerState(user: user, todaysale: todaysale);
}

class _ManagerState extends State<Manager> {
  final User user;
  final double todaysale;
  _ManagerState({required this.user, required this.todaysale});

  String selectedItem = 'Dashboard';

  void _navigateToPage(String pageName) {
    selectedItem = pageName;
    print('Navigating to: $pageName');

    Navigator.of(context).pop();
    setState(() {});
  }

  @override
  void initState() {
  
    super.initState();
    fetchbillmaster();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scafWidgets(context, smsg: "Login sucessfully", coolors: Colors.green);
    });
  }

  fetchbillmaster() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String billmasternew = prefs.getString('billMasters') ?? "[]";
  
    List newbillmasters = jsonDecode(billmasternew);

    print(newbillmasters);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(selectedItem);
    final drawerItems = getDrawerItems(user.roleId);
    var bodyContent;
    switch (selectedItem) {
      case 'Dashboard':
        bodyContent = DashBoard(
          loggedInUserRole: widget.roleid,
          currentuser: widget.user.userName,
          previousDaySale: 100,
        );
        break;
      case 'Stock Entry':
        bodyContent = StockEntry();
        break;
      case 'Stock View':
        bodyContent = StockView();
        break;
      case 'Sales Report':
        bodyContent = SalesReport();
        break;

      case 'Logout':
        bodyContent = logout(context, user.userName);
        break;

      default:
        bodyContent = DashBoard(
          loggedInUserRole: widget.user.roleId,
          currentuser: user.userName,
          previousDaySale: 100,
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MedApp'),
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
                                title: Text(
                                  item,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Divider(
                              height: 1.5,
                              color: Colors.black,
                            ),
                          ],
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
      body: bodyContent,
    );
  }
}
