





import 'package:flutter/material.dart';
import 'package:medapp/addusere.dart';
import 'package:medapp/dats.dart';
import 'package:medapp/login.dart';
import 'package:medapp/loginHistory.dart';
import 'package:medapp/widget/billerwidget.dart';
import 'package:medapp/widget/sadminwidget.dart';

class SystemAdmin extends StatefulWidget {
  final User user;

  SystemAdmin({required this.user});

  @override
  _SystemAdminState createState() => _SystemAdminState(user: user);
}

class _SystemAdminState extends State<SystemAdmin> {
  final User user;

  _SystemAdminState({required this.user});

  String selectedItem = 'Dashboard';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scafWidgets(context, smsg: "Login sucessfully", coolors: Colors.green);
    });
  }

  var bodyContent;
  void _navigateToPage(String pageName) {
    selectedItem = pageName;
    print('Navigating to: $pageName');
    Navigator.of(context).pop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final drawerItems = getDrawerItems(user.roleId);

    switch (selectedItem) {
      case 'Dashboard':
        bodyContent = syAdmindash(context);
        break;
      case 'Add User':
        bodyContent = AddUser();
        break;

      case 'Login History':
        bodyContent = LoginHistoryPage();
        break;

      case 'Logout':
        bodyContent = logout(context, user.userName);
        break;
      default:
        bodyContent = syAdmindash(context);
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