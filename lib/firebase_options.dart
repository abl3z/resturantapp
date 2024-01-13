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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAZZtvuRpwCDLis69Ou2fp0bag9oKSy41Y',
    appId: '1:212215202086:web:f0b6a7f21b6b6fc65c41e7',
    messagingSenderId: '212215202086',
    projectId: 'resturant-1b3fc',
    authDomain: 'resturant-1b3fc.firebaseapp.com',
    storageBucket: 'resturant-1b3fc.appspot.com',
    measurementId: 'G-H7N77V0E6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4iz6UM5QEb8G9-FZkZX7eNOog381h0Ak',
    appId: '1:212215202086:android:185b755c73c0615a5c41e7',
    messagingSenderId: '212215202086',
    projectId: 'resturant-1b3fc',
    storageBucket: 'resturant-1b3fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmdm2fNo_cwMOfyH-ikY4B5VaehHLErNk',
    appId: '1:212215202086:ios:979598a2ebb703255c41e7',
    messagingSenderId: '212215202086',
    projectId: 'resturant-1b3fc',
    storageBucket: 'resturant-1b3fc.appspot.com',
    iosBundleId: 'com.example.resturantapp',
  );
}
