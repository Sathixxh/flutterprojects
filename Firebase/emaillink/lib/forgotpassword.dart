import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Forgotpasssword extends StatefulWidget {
  const Forgotpasssword({super.key});

  @override
  State<Forgotpasssword> createState() => _ForgotpassswordState();
}

class _ForgotpassswordState extends State<Forgotpasssword> {
  TextEditingController emailconttroler = TextEditingController();

  forgotPass() async {
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailconttroler.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailconttroler,
              decoration: InputDecoration(label: Text(" enter your email")),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  forgotPass();
                },
                child: Text("Reset"))
          ],
        ),
      ),
    ));
  }
}
