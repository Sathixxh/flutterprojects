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
      theme: ThemeData(useMaterial3: false),
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
  String countryCode = '+91'; // Country code

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Phone Number Verification",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Your security is important to us. So Please enter your mobile number to receive a verification code via SMS. ",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: mobNoController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 232, 231, 231)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 232, 231, 231),
                        hintText: 'Enter your Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(countryCode),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 98, 82, 238),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String phoneNumber = countryCode + mobNoController.text;
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent: (String verificationId,
                              int? forceResendingToken) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                  verificationid: verificationId,
                                  phoneNumber: phoneNumber,
                                ),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                          phoneNumber: phoneNumber,
                        );
                      },
                      child: Text('Send OTP'),
                    ),
                    Image.asset(
                        "assets/images/enter-your-number-2-step-verification-illustration-concept_108061-1256-removebg-preview.png")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  final String verificationid;
  final String phoneNumber; // Add phoneNumber parameter

  OtpScreen({
    Key? key,
    required this.verificationid,
    required this.phoneNumber, // Initialize phoneNumber
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  // Function to resend OTP
  void resendOTP() async {
    String phoneNumber = widget.phoneNumber; // Retrieve phoneNumber from widget
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        // Navigate to OTP screen again with new verificationId
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationid: verificationId,
              phoneNumber: phoneNumber, // Pass phoneNumber again
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 98, 82, 238),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                      verificationId: widget.verificationid,
                      smsCode: otpController.text,
                    );

                    await FirebaseAuth.instance
                        .signInWithCredential(credential);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ),
                    );
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: Text("Verify OTP"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 98, 82, 238),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  resendOTP(); // Call resendOTP function
                },
                child: Text("Resend OTP"),
              ),
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
