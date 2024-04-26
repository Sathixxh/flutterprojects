import 'package:flutter/material.dart';

import 'package:onboardscreen/utils.dart';

class NewPAssword extends StatefulWidget {
  const NewPAssword({super.key});

  @override
  State<NewPAssword> createState() => _NewPAsswordState();
}

class _NewPAsswordState extends State<NewPAssword> {
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
Image.asset("assets/illustration/change-password.png" , height: 100,width: 100,),

            SizedBox(
              height: 80.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text(
                  "Change Password ",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              // color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
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
                          labelText: "New Password",
                           labelStyle: TextStyle(color: const Color.fromARGB(255, 83, 82, 82))),
                    ),
                    TextFormField(
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
                          labelText: "Confirm Password",
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 83, 82, 82))),
                    ),
                 
                    ElevatedButton(
                        style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ()));
                        },
                        child: Text(
                          " Reset ",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
