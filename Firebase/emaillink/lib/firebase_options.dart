// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDJ3ewUvXpTb21CsyWCKJ-QTIPDhDCckSs',
    appId: '1:543415277890:web:aa49266f7dc933acd910db',
    messagingSenderId: '543415277890',
    projectId: 'emaillink-c3ec5',
    authDomain: 'emaillink-c3ec5.firebaseapp.com',
    storageBucket: 'emaillink-c3ec5.appspot.com',
    measurementId: 'G-W0T10GBTJK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqz3nS2z-gVHdUxsPeWKpveeTjdYgboZE',
    appId: '1:543415277890:android:aebc5fb002742e8ed910db',
    messagingSenderId: '543415277890',
    projectId: 'emaillink-c3ec5',
    storageBucket: 'emaillink-c3ec5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0yBebydfd4iwHB07xDfRMI-FoaQeMiBQ',
    appId: '1:543415277890:ios:660b115c7fe779acd910db',
    messagingSenderId: '543415277890',
    projectId: 'emaillink-c3ec5',
    storageBucket: 'emaillink-c3ec5.appspot.com',
    iosBundleId: 'com.example.emaillink',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0yBebydfd4iwHB07xDfRMI-FoaQeMiBQ',
    appId: '1:543415277890:ios:002b8bb08af03381d910db',
    messagingSenderId: '543415277890',
    projectId: 'emaillink-c3ec5',
    storageBucket: 'emaillink-c3ec5.appspot.com',
    iosBundleId: 'com.example.emaillink.RunnerTests',
  );
}