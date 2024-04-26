

import 'package:flutter/material.dart';
import 'package:medapp/dats.dart';

class RemoveUser extends StatefulWidget {
  const RemoveUser({super.key});

  @override
  State<RemoveUser> createState() => _RemoveUserState();
}

class _RemoveUserState extends State<RemoveUser> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController roleidController = TextEditingController();
  final form1 = GlobalKey<FormState>();

  void scafMes(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void removeUser() {
    String username = usernameController.text;
    String role = roleidController.text;

    int indexToRemove = -1;

    for (int i = 0; i < users.length; i++) {
      if (users[i].userName == username && users[i].roleId == role) {
        indexToRemove = i;
        break;
      }
    }

    if (indexToRemove != -1) {
      users.removeAt(indexToRemove);
      scafMes('User removed successfully');
    } else {
      scafMes('User not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: Form(
                  key: form1,
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
                      TextFormField(
                        controller: usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the fields';
                          }
                          const usernamePattern = r'^[a-zA-Z0-9_]+$';
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
                          prefixIcon: const Icon(Icons.person),
                          iconColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      TextFormField(
                        controller: roleidController,
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
                          labelText: "Role",
                          prefixIcon: const Icon(Icons.lock),
                          iconColor: Colors.blue,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (form1.currentState!.validate()) {
                            removeUser();
                          }
                        },
                        child: const Text('Remove'),
                      ),
                      const Text(
                        "errorMessage",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class RemoveUser extends StatefulWidget {
//   const RemoveUser({super.key});

//   @override
//   State<RemoveUser> createState() => _RemoveUserState();
// }

// class _RemoveUserState extends State<RemoveUser> {
//     final TextEditingController usernameController = TextEditingController();
//   final TextEditingController roleidController = TextEditingController();
//     final form1 = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return  
     
//        Center(
      
//        child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.47,
//                 width: MediaQuery.of(context).size.width * 0.70,
//                 child: Card(
//                   elevation: 20.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Form(
//                       key: form1,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "MEDAPP",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           TextFormField(
//                             controller: usernameController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please enter the fields';
//                               }
//                               final usernamePattern = r'^[a-zA-Z0-9_]+$';
//                               final RegExp regex = RegExp(usernamePattern);
//                               if (!regex.hasMatch(value)) {
//                                 return 'Username can only contain letters, numbers, and underscores.';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               labelText: "Username",
//                               prefixIcon: Icon(Icons.person),
//                               iconColor: Colors.blue,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           TextFormField(
//                             controller: roleidController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please enter the fields';
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               labelText: "role",
//                               prefixIcon: Icon(Icons.lock),
//                               iconColor: Colors.blue,
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (form1.currentState!.validate()) {
                              
//                               }
//                             },
//                             child: Text('Remove'),
//                           ),
//                           Text(
//                             "errorMessage",
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
    
//     );
    
//   }
// }






























