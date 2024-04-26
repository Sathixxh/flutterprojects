
import 'package:flutter/material.dart';
import 'package:medapp/billentery.dart';
import 'package:medapp/dashborad.dart';
import 'package:medapp/dats.dart';
import 'package:medapp/login.dart';
import 'package:medapp/stockviewdone.dart';
import 'package:medapp/widget/billerwidget.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  final double todaysale;
  final String roleid;

  HomeScreen(
      {required this.user, required this.todaysale, required this.roleid});

  @override
  _HomeScreenState createState() =>
      _HomeScreenState(user: user, todaysale: todaysale);
}

class _HomeScreenState extends State<HomeScreen> {
  final User user;
  final double todaysale;
  _HomeScreenState({required this.user, required this.todaysale});

  String selectedItem = 'Dashboard';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scafWidgets(context, smsg: "Login sucessfully", coolors: Colors.green);
    });
  }

  void _navigateToPage(String pageName) {
    selectedItem = pageName;
    Navigator.of(context).pop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<String> drawerItems = getDrawerItems(user.roleId);
    var bodyContent;

    switch (selectedItem) {
      case 'Dashboard':
        bodyContent = DashBoard(
          loggedInUserRole: widget.roleid,
          currentuser: widget.user.userName,
          previousDaySale: 100,
        );
        break;
      case 'Stockview':
        bodyContent = StockView();
        break;
      case 'Bill Entry':
        bodyContent = BillEntryScreen(currentuser: widget.user.userName);
        break;
      case 'Logout':
        bodyContent = logout(context, user.userName);
        break;
      default:
        bodyContent = DashBoard(
            loggedInUserRole: widget.roleid,
            currentuser: widget.user.userName,
            previousDaySale: 100);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('MedApp'),
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
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Symbol_from_Marvel%27s_The_Avengers_logo.svg/1754px-Symbol_from_Marvel%27s_The_Avengers_logo.svg.png"),
                  ),
                  SizedBox(height: 20.0),
                  Text(user.userName),
                ],
              ),
            ),
            SizedBox(
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
                            const Divider(
                              height: 1.5,
                              color: Colors.black,
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      body: bodyContent,
    );
  }
}
