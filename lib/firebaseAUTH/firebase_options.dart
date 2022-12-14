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
    apiKey: 'AIzaSyDkbzmSsBuNT5aV-q6tWOWBnaqnz22hbLU',
    appId: '1:18270724451:web:4b42162b9574302a897356',
    messagingSenderId: '18270724451',
    projectId: 'travel-app-4989e',
    authDomain: 'travel-app-4989e.firebaseapp.com',
    storageBucket: 'travel-app-4989e.appspot.com',
    measurementId: 'G-XWT0KT4V5P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEAr8_XBBb-WwRpFZQeo_dB7BbcWxKIjA',
    appId: '1:18270724451:android:1ed5711be2f4cfdb897356',
    messagingSenderId: '18270724451',
    projectId: 'travel-app-4989e',
    storageBucket: 'travel-app-4989e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAn1P3UcT2TygWL__P4VqnMRqcByICPZiQ',
    appId: '1:18270724451:ios:52bafd63fd6746e8897356',
    messagingSenderId: '18270724451',
    projectId: 'travel-app-4989e',
    storageBucket: 'travel-app-4989e.appspot.com',
    iosClientId: '18270724451-ttpkve8o5a0l5ic7snh042otnrl1poko.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAn1P3UcT2TygWL__P4VqnMRqcByICPZiQ',
    appId: '1:18270724451:ios:52bafd63fd6746e8897356',
    messagingSenderId: '18270724451',
    projectId: 'travel-app-4989e',
    storageBucket: 'travel-app-4989e.appspot.com',
    iosClientId: '18270724451-ttpkve8o5a0l5ic7snh042otnrl1poko.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelApp',
  );
}
