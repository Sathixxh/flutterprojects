
import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';
import 'package:medapp/widget/billerwidget.dart';


class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rollidController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
  final form1 = GlobalKey<FormState>();
  String? selectedRole; 
  final List<String> roles = ['biller', 'manager', 'inventory', 'admin'];
  bool _passwordVisible = false;

  void scafMes() async {
  scafWidgets(context, smsg: "userAdd sucessfully", coolors: Colors.green);

 
  }





void aUser(User newUser) async {
  if (selectedRole != null) {
    String newUserName = usernameController.text;
    bool isExistingUser = users.any((user) => user.userName == newUserName);

    if (isExistingUser) {
    


        scafWidgets(context, smsg: "user anme allready exists", coolors: Colors.red);
      
    } else {
      newUser = User(
        userName: newUserName,
        password: passwordController.text,
        roleId: selectedRole!,
      );
      users.add(newUser);
      scafMes();
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width * 0.70,
              child: Card(
                elevation: 20.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: form1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "MEDAPP",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the fields';
                            }
                            else if (value==usernameController) {
                              return"Username is allready present" ;
                            
                            }
                            final usernamePattern = r'^[a-zA-Z0-9_]+$';
                            final RegExp regex = RegExp(usernamePattern);
                            if (!regex.hasMatch(value)) {
                              return 'Username can only contain letters, numbers, and underscores.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Username",
                            prefixIcon: Icon(Icons.person),
                            iconColor: Colors.blue,
                          ),
                        ),
                            SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      
            DropdownButtonFormField<String>(
              
              value: selectedRole,
              onChanged: (newValue) {
                setState(() {
                  selectedRole = newValue;
                  print(selectedRole);
                });
              },
              items: roles.map((role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: "Role of user",
                prefixIcon: Icon(Icons.person),
                iconColor: Colors.blue,
                
              ),
            ),
            
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !_passwordVisible, 
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the fields';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            iconColor: Colors.blue,
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
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormField(
                              obscureText: !_passwordVisible, 
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            iconColor: Colors.blue,
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        ElevatedButton(
  onPressed: () {
    if (form1.currentState!.validate()) {
      User newUser = User(
        userName: usernameController.text,
        password: passwordController.text,
        roleId: rollidController.text,
      );
      aUser(newUser); 
   

     
    }
  },
  child: Text('ADD'),
),
                                                                                                                                                                                                                                                                                 
                      ],
                    ),
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
























