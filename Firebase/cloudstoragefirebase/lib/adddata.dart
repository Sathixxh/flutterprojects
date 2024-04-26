import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  addData(String name, String pass) {
    FirebaseFirestore.instance
        .collection("users")
        .doc("details")
        .set({"Name": name, "Password": pass}).then((value) => "");
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                hintText: "Enter name", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextFormField(
            controller: passController,
            decoration: InputDecoration(
                hintText: "Enter name", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
              onPressed: () {
                addData(nameController.text, passController.text);
              },
              child: Text("done"))
        ],
      ),
    ));
  }
}
