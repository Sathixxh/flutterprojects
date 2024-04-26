// ignore_for_file: prefer_const_constructors_in_immutables, use_build_context_synchronously, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:emailotp/anialert.dart';
import 'package:flutter/material.dart';
import 'package:email_otp/email_otp.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EmailOTPForm());
  }
}

class EmailOTPForm extends StatefulWidget {
  const EmailOTPForm({Key? key}) : super(key: key);

  @override
  _EmailOTPFormState createState() => _EmailOTPFormState();
}

class _EmailOTPFormState extends State<EmailOTPForm> {
  TextEditingController email = TextEditingController();
  EmailOTP myauth = EmailOTP();

  void sendOTP() async {
    myauth.setConfig(
      appEmail: "me@sathixh.com",
      appName: "Email OTP",
      userEmail: email.text,
      otpLength: 6,
      otpType: OTPType.digitsOnly,
    );
    if (await myauth.sendOTP() == true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.green,
        content: Text("OTP has been sent"),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(
            email: email.text,
            onOTPVefified: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("OTP is verified"),
              ));
            },
            myauth: myauth, // Pass the myauth instance
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Oops, OTP send failed"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PLEASE VERFIY YOUR EMAIL",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 98, 82, 238),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "To ensure the security of your account and access all features, it's important to verify your email address.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(221, 77, 76, 76),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: SizedBox(
                height: 200,
                child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                              hintText: "Enter your Email",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)))),
                        ),
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
                        onPressed: sendOTP,
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/images/Email campaign-rafiki.png",
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}

class OTPScreen extends StatefulWidget {
  final String email;
  final VoidCallback? onOTPVefified;
  final EmailOTP myauth; // Pass the myauth instance

  OTPScreen({required this.email, this.onOTPVefified, required this.myauth});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromARGB(255, 151, 146, 223),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Center(
                child: Text(
                  "A verification OTP has been sent to your email address. Please check your email for a message from us. Once you receive the OTP, enter it in the field below to complete the verification process. If you haven't received the email within a few minutes, you can click the 'Resend OTP' button below to request another OTP.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,

                    // Adjust the color as needed
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Card(
                      shape: ContinuousRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PinInputTextField(
                              controller: otp,
                              pinLength: 6, // Length of the OTP
                              onChanged: (pin) {
                                // Handle OTP change if needed
                              },
                              decoration: CirclePinDecoration(
                                strokeColorBuilder:
                                    const FixedColorBuilder(Colors.black54),
                              ),
                            ),
                            const Text("Enter your otp !"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 98, 82, 238),
                                    ),
                                    shape: MaterialStateProperty.all<
                                                 RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (await widget.myauth
                                        .verifyOTP(otp: otp.text)) {
                                      if (widget.onOTPVefified != null) {
                                        widget.onOTPVefified!();
                                        showSuccessMessage(context);
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text("Invalid OTP"),
                                      ));
                                    }
                                  },
                                  child: const Text("Verify OTP"),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 98, 82, 238),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (await widget.myauth.sendOTP()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text("New OTP has been sent"),
                                      ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.red,
                                        content:
                                            Text("Oops, OTP resend failed"),
                                      ));
                                    }
                                  },
                                  child: const Text("Resend OTP"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/Two factor authentication-rafiki.png",
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}

void showSuccessMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Image.asset(
          "assets/images/verified-unscreen.gif",
          height: 100.0,
          width: 100.0,
        ),
        content: Text('  E-mail Verified successfully!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sucessfully(),
                  ));
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

class Sucessfully extends StatefulWidget {
  const Sucessfully({super.key});

  @override
  State<Sucessfully> createState() => _SucessfullyState();
}

class _SucessfullyState extends State<Sucessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/mail-unscreen.gif",
            height: 100.0,
            width: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              "Your email verification is complete! Thank you for confirming your email address. You're now part of our community. Let's get started!",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Image.asset("assets/images/Verified-rafiki.png"),
          ),
        ],
      ),
    );
  }
}
