// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHistoryPage extends StatefulWidget {
  const LoginHistoryPage({super.key});

  @override
  _LoginHistoryPageState createState() => _LoginHistoryPageState();
}

class _LoginHistoryPageState extends State<LoginHistoryPage> {
  List<LoginHistory> historyList = [];
  TextEditingController searchingController = TextEditingController();

  List<LoginHistory> filteredList = [];
  @override
  void initState() {
    super.initState();
    fetchLoginHistory();
  }

  Future<void> fetchLoginHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? loginHistoryList = prefs.getStringList('loginHistory');
    print(loginHistoryList);

    if (loginHistoryList != null) {
      setState(() {
        historyList = loginHistoryList.map((entry) {
          return LoginHistory.fromJson(json.decode(entry));
        }).toList();
        filteredList = historyList; 
      });
    }
  }

  void filterHistory(String input) {
    setState(() {
      if (input.isEmpty) {
        filteredList = historyList;
      } else {
        filteredList = historyList
            .where((entry) =>
                entry.username.toLowerCase().contains(input.toLowerCase()) ||
                entry.type.toLowerCase().contains(input.toLowerCase()) ||
                entry.date.toString().contains(input))
            .toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          TextField(
            controller: searchingController,
            onChanged: (value) {
              filterHistory(value);
            },
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search),
            ),
          ),
          SingleChildScrollView(
            child: DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('Username')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Date')),
              ],
              rows: filteredList
                  .map(
                    (entry) => DataRow(
                      cells: [
                        DataCell(Text(entry.username)),
                        DataCell(Text(entry.type)),
                        DataCell(Text(entry.date.toString())),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
