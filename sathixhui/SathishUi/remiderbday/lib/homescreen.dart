import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpcomingBirthdaysScreen extends StatefulWidget {
  const UpcomingBirthdaysScreen({super.key});

  @override
  State<UpcomingBirthdaysScreen> createState() =>
      _UpcomingBirthdaysScreenState();
}

class _UpcomingBirthdaysScreenState extends State<UpcomingBirthdaysScreen> {
  List<BirthdayData> upcomingBirthdays = [];
  List<BirthdayData> todayBirthdays = [];

  @override
  void initState() {
    super.initState();
    loadUpcomingBirthdays();
  }

  Future<void> loadUpcomingBirthdays() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    String data = sref.getString('data') ?? '[]';
    List<dynamic> decodedData = jsonDecode(data);
    List<BirthdayData> allBirthdays = [];
    for (var item in decodedData) {
      allBirthdays.add(BirthdayData(
        name: item['name'],
        date: item['date'],
      ));
    }
    DateTime today = DateTime.now();
    upcomingBirthdays = allBirthdays.where((birthday) {
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(birthday.date);
      return parsedDate.month == today.month && parsedDate.day > today.day;
    }).toList();

    todayBirthdays = allBirthdays.where((birthday) {
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(birthday.date);
      return parsedDate.month == today.month && parsedDate.day == today.day;
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 220, 235),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 100, 113, 187),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
    
                Text(
                  "Today's Birthdays",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),

                Column(
                  children: todayBirthdays.map((birthday) {
                    return Todaylist(birthday: birthday);
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1.0,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30.0))
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Upcoming Birthdays",style: TextStyle(
                    fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold
                  ),),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: upcomingBirthdays.map((birthday) {
                        return BirthdayListItem(birthday: birthday);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BirthdayData {
  final String name;
  final String date;

  BirthdayData({required this.name, required this.date});
}

class BirthdayListItem extends StatefulWidget {
  final BirthdayData birthday;

  BirthdayListItem({required this.birthday});

  @override
  _BirthdayListItemState createState() => _BirthdayListItemState();
}

class _BirthdayListItemState extends State<BirthdayListItem>
    with TickerProviderStateMixin {
  late Duration remainingTime;

  @override
  void initState() {
    super.initState();
    if (widget.birthday.date != null) {
      _updateRemainingTime();

      Ticker ticker = createTicker((elapsed) {
        _updateRemainingTime();
      });
      ticker.start();
    }
  }

  void _updateRemainingTime() {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(widget.birthday.date);
    Duration difference = parsedDate.difference(DateTime.now());
    setState(() {
      remainingTime = difference;
    });
  }

  @override
  Widget build(BuildContext context) {
    String remainingTimeStr = widget.birthday.date != null
        ? '${remainingTime.inDays}d ${remainingTime.inHours % 24}h ${remainingTime.inMinutes % 60}m ${remainingTime.inSeconds % 60}s'
        : 'No countdown';

    return Center(
      child: Column(
        
        children: [
          if (widget.birthday.date != null) 
            SizedBox(
              height: 100.0,
              width: 150.0,
              child: Card(

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${widget.birthday.name}'),
                    Text(widget.birthday.date ?? 'No date'),
                    Text(remainingTimeStr),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Todaylist extends StatelessWidget {
  final BirthdayData birthday;

  Todaylist({required this.birthday});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100.0,
            width: 150.0,
            child: Card(
              
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${birthday.name}'),
                  Text(birthday.date ?? 'No date'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
