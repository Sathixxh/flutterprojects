import 'package:flutter/material.dart';
import 'package:notilocal/localnoti.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    listenToNotifications();
    super.initState();
  }

//  to listen to any notification clicked or not
  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {
      print(event);
      Navigator.pushNamed(context, '/another', arguments: event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Local Notifications")),
      body: Container(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.notifications_outlined),
                onPressed: () {
                  LocalNotifications.showSimpleNotification(
                      title: "Simple Notification",
                      body: "This is a simple notification",
                      payload: "This is simple data");
                },
                label: Text("Simple Notification"),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}