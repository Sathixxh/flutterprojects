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
    apiKey: 'AIzaSyBANed_gvW-8TBZ1Ikn7u8_FH_ktCYB7jM',
    appId: '1:708315893943:web:3cf4d165ac1f8c1ed2bd32',
    messagingSenderId: '708315893943',
    projectId: 'fir-firebase-8988c',
    authDomain: 'fir-firebase-8988c.firebaseapp.com',
    storageBucket: 'fir-firebase-8988c.appspot.com',
    measurementId: 'G-QEYYKXW7WP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFPWhM3CjSGjZKef09LNtJXIWmh2Luj54',
    appId: '1:708315893943:android:97be9fcb78578314d2bd32',
    messagingSenderId: '708315893943',
    projectId: 'fir-firebase-8988c',
    storageBucket: 'fir-firebase-8988c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBOdWb8De84JVXg8tgDpFQg2f22FBkTffw',
    appId: '1:708315893943:ios:ce207c67d3fe4563d2bd32',
    messagingSenderId: '708315893943',
    projectId: 'fir-firebase-8988c',
    storageBucket: 'fir-firebase-8988c.appspot.com',
    iosBundleId: 'com.example.localnoti',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBOdWb8De84JVXg8tgDpFQg2f22FBkTffw',
    appId: '1:708315893943:ios:3b5ec7ec779eecddd2bd32',
    messagingSenderId: '708315893943',
    projectId: 'fir-firebase-8988c',
    storageBucket: 'fir-firebase-8988c.appspot.com',
    iosBundleId: 'com.example.localnoti.RunnerTests',
  );
}
