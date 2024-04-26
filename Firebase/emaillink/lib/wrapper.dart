import 'package:emaillink/login.dart';
import 'package:emaillink/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapperpage extends StatefulWidget {
  const Wrapperpage({Key? key});

  @override
  State<Wrapperpage> createState() => _WrapperpageState();
}

class _WrapperpageState extends State<Wrapperpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('signin first'),
                  ),
                );
              });

              return Loginpage();
            }
          },
        ),
      ),
    );
  }
}
