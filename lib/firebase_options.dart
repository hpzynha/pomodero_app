// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCqqezHYHD014vtDv4xwG19g0bjMH-sAV8',
    appId: '1:810207451187:web:57f330c0d5d553e4b0ab46',
    messagingSenderId: '810207451187',
    projectId: 'pomderoapp',
    authDomain: 'pomderoapp.firebaseapp.com',
    storageBucket: 'pomderoapp.appspot.com',
    measurementId: 'G-K10JS501JR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChNfdqq3xjzeRlPRPVuVUeclJeq2lUXVY',
    appId: '1:810207451187:android:7fa6b093846b58dab0ab46',
    messagingSenderId: '810207451187',
    projectId: 'pomderoapp',
    storageBucket: 'pomderoapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBZQp6w7J1h-XN_7TjRAfrz3oGGx-UAZU',
    appId: '1:810207451187:ios:b3eadcc652d5a9b0b0ab46',
    messagingSenderId: '810207451187',
    projectId: 'pomderoapp',
    storageBucket: 'pomderoapp.appspot.com',
    iosBundleId: 'com.example.pomoderoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBZQp6w7J1h-XN_7TjRAfrz3oGGx-UAZU',
    appId: '1:810207451187:ios:b3eadcc652d5a9b0b0ab46',
    messagingSenderId: '810207451187',
    projectId: 'pomderoapp',
    storageBucket: 'pomderoapp.appspot.com',
    iosBundleId: 'com.example.pomoderoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCqqezHYHD014vtDv4xwG19g0bjMH-sAV8',
    appId: '1:810207451187:web:69e40b4144f75ae2b0ab46',
    messagingSenderId: '810207451187',
    projectId: 'pomderoapp',
    authDomain: 'pomderoapp.firebaseapp.com',
    storageBucket: 'pomderoapp.appspot.com',
    measurementId: 'G-GK80594LQ4',
  );
}