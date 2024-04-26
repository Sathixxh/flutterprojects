import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:pinput/pinput.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: PhoneNoauth(),
    );
  }
}

class PhoneNoauth extends StatefulWidget {
  const PhoneNoauth({super.key});

  @override
  State<PhoneNoauth> createState() => _PhoneNoauthState();
}

class _PhoneNoauthState extends State<PhoneNoauth> {
  TextEditingController mobNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("VerifcationPhoneNumber"),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: mobNoController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 232, 231, 231)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          // color: Color.fromARGB(255, 241, 208, 99)

                          ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 232, 231, 231),
                    // focusColor: Colors.amber,
                    hintText: 'Enter your Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent:
                          (String verificationId, int? forceResendingToken) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(
                              verificationid: verificationId,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (verificationId) {},
                      phoneNumber: mobNoController.text,
                    );
                  },
                  child: Text('verify Otp'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  final String verificationid;

  OtpScreen({
    Key? key,
    required this.verificationid,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("OTPScreen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,
                    controller: otpController,
                    onChanged: (value) {
                      // You can add your onChanged logic here
                    },
                    // Add other properties as per your requirement
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: otpController.text,
                    );

                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            ));
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Verify OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser;

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Text("${user!.email}"),
          FloatingActionButton(onPressed: () {
            signOut();
          })
        ],
      ),
    ));
  }
}
