import 'package:emaillink/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailconttroler = TextEditingController();
  TextEditingController passwprdconttroler = TextEditingController();

  creatUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailconttroler.text, password: passwprdconttroler.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                minWidth: 40,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).pop(),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            SizedBox(
              height: 80.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: emailconttroler,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 232, 231, 231)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 241, 208, 99)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 232, 231, 231),
                            focusColor: Colors.amber,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            labelText: "Email Address",
                            labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 83, 82, 82))),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: passwprdconttroler,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 232, 231, 231)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 241, 208, 99)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 232, 231, 231),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 83, 82, 82))),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          creatUser();
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Loginpage()));
                        },
                        child: Text(
                          "Sign-In",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                )),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
