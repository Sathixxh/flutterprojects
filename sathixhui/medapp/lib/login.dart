import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:medapp/dats.dart';
import 'package:medapp/homescreen.dart';
import 'package:medapp/inventory.dart';
import 'package:medapp/manager.dart';
import 'package:medapp/systemadd.dart';
import 'package:medapp/widget/billerwidget.dart';

import 'package:shared_preferences/shared_preferences.dart';
bool _passwordVisible = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final form1 = GlobalKey<FormState>();
  double todaysale = 10.0;

  @override
  void initState() {
    super.initState();
    usernameController.clear();
    passwordController.clear();
  }

  Future<void> _logouthis() async {
    String username = usernameController.text;
    String type = 'logout';
    DateTime date = DateTime.now();

    final loginHistory =
        LoginHistory(username: username, type: type, date: date);
    await saveLoginHistory(loginHistory);
  }

  void _login() {
    final username = usernameController.text;
    final password = passwordController.text;
    bool userExists = users.any((user) => user.userName == username);
      if (!userExists) {
  scafWidgets(context, smsg: "incorrect username", coolors: Colors.red)   ; 
    return;
  } bool passExists = users.any((user) => user.password == password);
  if (!passExists) {
  
    scafWidgets(context, smsg: "incorrect password", coolors: Colors.red)   ; 
  }

    if (userExists&&passExists) {
    
    LoginHistory loginHistory = LoginHistory(
      username: username,
      type: 'login',
      date: DateTime.now(),
    );
    saveLoginHistory(loginHistory);
    
    final authenticatedUser = users.firstWhere(
      (user) => user.userName == username && user.password == password,
      orElse: () => User(userName: "", password: "", roleId: "guest"),
    );

    if (authenticatedUser.roleId == "biller") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                  user: authenticatedUser,
                  todaysale: todaysale,
                  roleid: authenticatedUser.roleId)));
    } else if (authenticatedUser.roleId == "manager") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Manager(
                user: authenticatedUser,
                todaysale: todaysale,
                roleid: authenticatedUser.roleId)),
      );
    } else if (authenticatedUser.roleId == "inventory") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Inventry(user: authenticatedUser)),
      );
    } else if (authenticatedUser.roleId == "admin") {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SystemAdmin(user: authenticatedUser)),
      );
    }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Invalid username  and password',
            )),
      );
    }

    usernameController.clear();
    passwordController.clear();
  }

  saveLoginHistory(LoginHistory loginHistory) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loginHistoryList = prefs.getStringList('loginHistory') ?? [];
    loginHistoryList.add(json.encode(loginHistory.toJson()));
    prefs.setStringList('loginHistory', loginHistoryList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
              width: MediaQuery.of(context).size.width * 0.70,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "MEDAPP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Form(
                          key: form1,
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the user name';
                                  }
                                 
                                  return null;
                                },
                                enableSuggestions: false,
                           
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: "Username",
                                  prefixIcon: const Icon(Icons.person),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              TextFormField(
                                
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter the password';
                                  }

                                  return null;
                                },
                                obscureText: !_passwordVisible,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (form1.currentState!.validate()) {}
                                  _login();
                                },
                                child: const Text('LOGIN'),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



logout( context, String username) {
  saveLoginHistory(LoginHistory loginHistory) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> loginHistoryList = prefs.getStringList('loginHistory') ?? [];
    loginHistoryList.add(json.encode(loginHistory.toJson()));
    prefs.setStringList('loginHistory', loginHistoryList);
  }

  Future<void> _logouthis() async {
    String type = 'logout';
    DateTime date = DateTime.now();

    final loginHistory = LoginHistory(username: username, type: type, date: date);
    await saveLoginHistory(loginHistory);
  }

  return AlertDialog(
    title: const Text('Logout'),
    content: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Are you sure?'),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color.fromARGB(255, 60, 162, 64)),
                  ),
                  onPressed: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                      Navigator.of(context).pop();
                  },
                  child: const Text('Stayback'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    _logouthis();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Quit'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
