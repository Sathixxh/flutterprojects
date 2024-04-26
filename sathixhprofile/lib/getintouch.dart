import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GetInTouch extends StatefulWidget {
  const GetInTouch({super.key});

  @override
  State<GetInTouch> createState() => _GetInTouchState();
}

void openApp(BuildContext context, String appName, String appUrl,
    String playStoreUrl) async {
  if (await launchUrl(Uri.parse(appUrl))) {
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('App Not Installed'),
          content: Text('The $appName app is not installed on your device.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Launch Play Store URL
                launchUrl(Uri.parse(playStoreUrl));
              },
              child: Text('Install from Play Store'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class _GetInTouchState extends State<GetInTouch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50.0,
            child: Card(
                color: Color(0xFF0043D0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "About Me",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Popins",
                        color: Colors.white),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity ,
                  child: Card(
                    elevation: 3,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          "assets/gif/sathixh.jpg",
                          height: 200,
                        )),
                        SingleChildScrollView(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Name   :  Satheeshkumar.M ',
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text("Domine :  Flutter Developer",
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('Age    :  24', style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('Dob    :  27/11/1999',
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('Position: Software Engineer',
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('BloodGroup: B+',
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('Address:   Kpuram pudukkottai ',
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('Nationality:Indian',
                                  style: TextStyle(fontSize: 16.0)),
                              SizedBox(height: 16.0),
                              Text('Status: Employed',
                                  style: TextStyle(fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.0,
                ),
                // Image.asset(
                //   "assets/gif/Mobile Marketing.gif",
                //   height: 300,
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Get In Touch",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0043D0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Card(
                        elevation: 4,
                        shape: CircleBorder(),
                        child: IconButton(
                            onPressed: () {
                              openApp(
                                  context,
                                  'WhatsApp',
                                  'https://wa.me/+918825459539',
                                  'https://play.google.com/store/apps/details?id=com.whatsapp');
                            },
                            icon: Image.asset(
                              "assets/gif/whatsapp.png",
                              width: 50.0,
                              height: 50.0,
                            )),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Card(
                        elevation: 4,
                        shape: CircleBorder(),
                        child: IconButton(
                            onPressed: () {
                              openApp(
                                  context,
                                  'Instagram',
                                  'instagram://user?username=mr_sathixh_',
                                  'https://play.google.com/store/apps/details?id=com.instagram');
                            },
                            icon: Image.asset(
                              'assets/gif/instagram.png',
                              width: 40.0,
                              height: 40.0,
                            )),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Card(
                        elevation: 4,
                        shape: CircleBorder(),
                        child: IconButton(
                            onPressed: () {
                              openApp(
                                  context,
                                  'LinkedIn',
                                  'https://www.linkedin.com/in/Satheesh-kumar-41b308228/',
                                  'https://play.google.com/store/apps/details?id=com.linkedin.android');
                            },
                            icon: Image.asset(
                              'assets/gif/linkedin.png',
                              width: 40.0,
                              height: 40.0,
                            )),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Card(
                        elevation: 4,
                        shape: CircleBorder(),
                        child: IconButton(
                            onPressed: () {
                              final Uri _emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'satheesindhra@gmail.com',
                              );
                              launchUrlString(_emailLaunchUri.toString());
                            },
                            icon: Image.asset(
                              'assets/gif/mail.png',
                              width: 50.0,
                              height: 50.0,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    elevation: 5.0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Thank you for taking the time to visit my profile!.Your interest means a lot to me, and I'm grateful for the opportunity to showcase my skills and experience. If you have any questions or would like to discuss potential collaborations, I'm always open to new opportunities and look forward to the possibility of working together in the future.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 54, 57, 218),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
