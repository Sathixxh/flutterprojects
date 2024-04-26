import 'package:emaillink/forgotpassword.dart';
import 'package:emaillink/main.dart';
import 'package:emaillink/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailconttroler = TextEditingController();
  TextEditingController passwprdconttroler = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailconttroler.text, password: passwprdconttroler.text);
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
              decoration: InputDecoration(label: Text("email")),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwprdconttroler,
              decoration: InputDecoration(label: Text("Password")),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Forgotpasssword(),
                      ));
                },
                child: Text("forgetpassword")),
            ElevatedButton(
                onPressed: () {
                  signIn();
                  HomePage();
                },
                child: Text("login")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signin(),
                      ));
                },
                child: Text("dont account"))
          ],
        ),
      ),
    ));
  }
}
