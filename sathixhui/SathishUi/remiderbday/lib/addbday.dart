import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddBirthday extends StatefulWidget {
  const AddBirthday({Key? key}) : super(key: key);

  @override
  State<AddBirthday> createState() => _AddBirthdayState();
}

class _AddBirthdayState extends State<AddBirthday> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  List<Map<String, String>> allBirthdays = [];
  List<Map<String, String>> upcomingBirthdays = [];

  @override
  void initState() {
    super.initState();
    loadBirthdays();
  }

  loadBirthdays() async {
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
      updateUpcomingBirthdays();
    });
  }

  submit() async {
    SharedPreferences sref = await SharedPreferences.getInstance();
    String data = sref.getString('data') ?? '[]';
    List l1 = jsonDecode(data);
    l1.add({
      'name': nameController.text,
      'date': DateFormat('dd-MM-yyyy').format(selectedDate!),
    });
    sref.setString('data', jsonEncode(l1));
    nameController.clear();
    selectedDate = null;

    loadBirthdays();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
        dateController.text = formattedDate;
      });
    }
  }

  updateUpcomingBirthdays() {
    DateTime today = DateTime.now();
    upcomingBirthdays = allBirthdays.where((birthday) {
      DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(birthday['date']!);
      return parsedDate.month == today.month && parsedDate.day >= today.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 220, 235),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Yours Favourite Bday.'),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 300,
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            labelText: 'name',
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          controller: dateController,
                          readOnly: true,
                          onTap: () => selectDate(context),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            labelText: 'BirthDate',
                            suffixIcon: Icon(Icons.calendar_month),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)))),
                            onPressed: () {
                              submit();
                              print("Add sucessfully");
                            },
                            child: Text("Add")),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
