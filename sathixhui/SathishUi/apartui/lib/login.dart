import 'package:flutter/material.dart';

import 'package:houseui/sc1.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 40,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: Text(
                  "We're glad to see you again",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              //  color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          labelText: "Email Address"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          labelText: "Password"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          print("Forget Password tapped");
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.indigo),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Sc1()));
                        },
                        child: const Text(
                          "Log-In",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "Enter your credentials to access your account and continue your journey with us",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    height: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("OR"),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //         iconSize: 50.0,
            //         icon: Image.asset(
            //             "assets/images/1f9e0a1e0166b2f57186134ef0264ade-removebg-preview.png"),
            //         onPressed: () {}),
            //     IconButton(
            //         iconSize: 50.0,
            //         icon: Image.asset("assets/images/pngegg (1).png"),
            //         onPressed: () {}),
            //     IconButton(
            //         iconSize: 50.0,
            //         icon: Image.asset(
            //             "images/99655e9fe24eb0a7ea38de683cedb735-removebg-preview.png"),
            //         onPressed: () {}),
            //   ],
            // ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Signin()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Dont have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' Sign-up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
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
