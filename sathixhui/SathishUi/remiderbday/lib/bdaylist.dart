import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllBirthdaysScreen extends StatefulWidget {
  @override
  _AllBirthdaysScreenState createState() => _AllBirthdaysScreenState();
}

class _AllBirthdaysScreenState extends State<AllBirthdaysScreen> {
  late List<Map<String, String>> allBirthdays = [];

  @override
  void initState() {
    super.initState();
    loadAllBirthdays();
  }

  Future<void> loadAllBirthdays() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    String data = sref.getString('data') ?? '[]';
    List<dynamic> decodedData = jsonDecode(data);
    List<Map<String, String>> loadedBirthdays = [];
    for (var item in decodedData) {
      loadedBirthdays.add({
        'name': item['name'],
        'date': item['date'],
      });
    }
    setState(() {
      allBirthdays = loadedBirthdays;
    });
  }

String calculateRemainingDays(String date) {
    DateTime birthdayDate = DateFormat('dd-MM-yyyy').parse(date);
    DateTime currentDate = DateTime.now();
    Duration difference = birthdayDate.difference(currentDate);
    return '${difference.inDays} days remaining';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 220, 235),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All Birthday List",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            SingleChildScrollView(
              child: Column(
                children: allBirthdays.map((birthday) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: SizedBox(
                      height: 70.0,
                      width: 700,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: ListTile(
                          title: Text(
                            '${birthday['name']} ',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${birthday['date']}',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            calculateRemainingDays(birthday['date']!),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
