
// import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:localnoti/firebase_options.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

// Future _firebaseBackgroundMessage(RemoteMessage message) async {
//   if (message.notification != null) {
//     print("Some notification Received");
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     if (message.notification != null) {
//       print("Background Notification Tapped");
//       navigatorKey.currentState!.pushNamed("/message", arguments: message);
//     }
//   });
//   PushNotifications.init();
//   PushNotifications.localNotiInit();

//   FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     String payloadData = jsonEncode(message.data);
//     print("Got a message in foreground");
//     if (message.notification != null) {
//       PushNotifications.showSimpleNotification(
//           title: message.notification!.title!,
//           body: message.notification!.body!,
//           payload: payloadData);
//     }
//   });
//   final RemoteMessage? message =
//       await FirebaseMessaging.instance.getInitialMessage();
//   if (message != null) {
//     print("Launched from terminated state");
//     Future.delayed(const Duration(seconds: 1), () {
//       navigatorKey.currentState!.pushNamed("/message", arguments: message);
//     });
//   }
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       title: 'Push Notifications',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routes: {
//         '/': (context) => const HomePage(),
//         '/message': (context) => const Message()
//       },
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Push Notifications")),
//       body: Column(
//         children: [
//           Center(
//             child: Text(
//               "Notifications by using Firebase",
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Call function to show snackbar and send its message to Firebase
//               _showSnackbarAndSendToFirebase(context, "sucessfully");
//             },
//             child: Text("Show Snackbar"),
//           )
//         ],
//       ),
//     );
//   }

//   void _showSnackbarAndSendToFirebase(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 3),
//       ),
//     );

//     // Send the snackbar message to Firebase
//     PushNotifications.showSimpleNotification(
//       title: "Snackbar Notification",
//       body: message,
//       payload: message,
//     );
//   }
// }

// class PushNotifications {
//   static final _firebaseMessaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   static Future init() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     final token = await _firebaseMessaging.getToken();
//     print("device token: $token");
//   }

//   static Future localNotiInit() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       onDidReceiveLocalNotification: (id, title, body, payload) => null,
//     );
//     final LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);
//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onNotificationTap,
//         onDidReceiveBackgroundNotificationResponse: onNotificationTap);
//   }

//   static void onNotificationTap(NotificationResponse notificationResponse) {
//     navigatorKey.currentState!
//         .pushNamed("/message", arguments: notificationResponse);
//   }

//   static Future showSimpleNotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('your channel id', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin
//         .show(0, title, body, notificationDetails, payload: payload);
//   }
// }

// class Message extends StatefulWidget {
//   const Message({Key? key}) : super(key: key);

//   @override
//   State<Message> createState() => _MessageState();
// }

// class _MessageState extends State<Message> {
//   Map payload = {};

//   @override
//   Widget build(BuildContext context) {
//     final data = ModalRoute.of(context)!.settings.arguments;
//     if (data is RemoteMessage) {
//       payload = data.data;
//     }
//     if (data is NotificationResponse) {
//       payload = jsonDecode(data.payload!);
//     }

//     return Scaffold(
//       appBar: AppBar(title: Text("Your Message")),
//       body: Center(child: Text(payload.toString())),
//     );
//   }
// }
