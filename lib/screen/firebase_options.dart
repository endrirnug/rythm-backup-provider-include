// TODO Implement this library.// File generated by FlutterFire CLI.
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
    apiKey: 'AIzaSyDth9AIXR-vmnE3qr56L6hIW1mc9ILiZNM',
    appId: '1:159217976558:web:5a19a8ea4608ba266b9fff',
    messagingSenderId: '159217976558',
    projectId: 'fir-auth-15f4e',
    authDomain: 'fir-auth-15f4e.firebaseapp.com',
    storageBucket: 'fir-auth-15f4e.appspot.com',
    measurementId: 'G-75BE9XR3DN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOBRn6it0_SwCKX3zFZDJSSahc14qy-vw',
    appId: '1:159217976558:android:c3773e5c9e6a28ad6b9fff',
    messagingSenderId: '159217976558',
    projectId: 'fir-auth-15f4e',
    storageBucket: 'fir-auth-15f4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOl5BCpQDgukSrMMQbl7e8DL5A7DsP0gQ',
    appId: '1:159217976558:ios:f67366cb63014a0e6b9fff',
    messagingSenderId: '159217976558',
    projectId: 'fir-auth-15f4e',
    storageBucket: 'fir-auth-15f4e.appspot.com',
    iosBundleId: 'com.example.rythm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOl5BCpQDgukSrMMQbl7e8DL5A7DsP0gQ',
    appId: '1:159217976558:ios:e7353fc2ec17594a6b9fff',
    messagingSenderId: '159217976558',
    projectId: 'fir-auth-15f4e',
    storageBucket: 'fir-auth-15f4e.appspot.com',
    iosBundleId: 'com.example.rythm.RunnerTests',
  );
}