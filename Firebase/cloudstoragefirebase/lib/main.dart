import 'package:cloudstoragefirebase/adddata.dart';
import 'package:cloudstoragefirebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddData(),
    );
  }
}

class RealtimeDatabaseInsert extends StatelessWidget {
  RealtimeDatabaseInsert({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var dlController = TextEditingController();
  var adController = TextEditingController();
  var phnController = TextEditingController();

  final firestore = FirebaseFirestore.instance;

  get data => null;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Insert Driver Details',
                  style: TextStyle(fontSize: 28),
                ),
                const Text("Add Data"),
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: nameController,
                  maxLength: 15,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: adController,
                  decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: phnController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Phone No.',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty &&
                        ageController.text.isNotEmpty &&
                        adController.text.isNotEmpty &&
                        phnController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirmation"),
                            content: const Text(
                                "Are you sure you want to submit these details?"),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.amber),
                                ),
                                onPressed: () {
                                  nameController.clear();
                                  ageController.clear();

                                  adController.clear();
                                  phnController.clear();
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.amber),
                                ),
                                onPressed: () async {
                                  firestore.collection("User Details").add({
                                    "Name": nameController.text,
                                    "Age": ageController.text,
                                    "Address.": adController.text,
                                    "Phone No.": phnController.text,
                                  });

                                  Navigator.of(context).pop();
                                  nameController.clear();
                                  ageController.clear();

                                  adController.clear();
                                  phnController.clear();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Submit Details",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
