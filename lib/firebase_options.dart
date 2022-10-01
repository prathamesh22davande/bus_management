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
    apiKey: 'AIzaSyDLykAWFXYrBEi_jpDg9GU_Q9dZwZnLZSw',
    appId: '1:939268522452:web:b30470462d1de4c7f79641',
    messagingSenderId: '939268522452',
    projectId: 'busmanagement-ac95a',
    authDomain: 'busmanagement-ac95a.firebaseapp.com',
    storageBucket: 'busmanagement-ac95a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyAveUB-WBpKRogreqo8m37XUQ9z_FitM',
    appId: '1:939268522452:android:bd9225e62e6ea253f79641',
    messagingSenderId: '939268522452',
    projectId: 'busmanagement-ac95a',
    storageBucket: 'busmanagement-ac95a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC7hkLdsJzMumVIp3Fp0SR75Ph7jzStSw',
    appId: '1:939268522452:ios:408c96d4a7e67e0af79641',
    messagingSenderId: '939268522452',
    projectId: 'busmanagement-ac95a',
    storageBucket: 'busmanagement-ac95a.appspot.com',
    iosClientId: '939268522452-57ien6avt4kp1gkl4u6fbilqhs9p8j0j.apps.googleusercontent.com',
    iosBundleId: 'com.example.busManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCC7hkLdsJzMumVIp3Fp0SR75Ph7jzStSw',
    appId: '1:939268522452:ios:408c96d4a7e67e0af79641',
    messagingSenderId: '939268522452',
    projectId: 'busmanagement-ac95a',
    storageBucket: 'busmanagement-ac95a.appspot.com',
    iosClientId: '939268522452-57ien6avt4kp1gkl4u6fbilqhs9p8j0j.apps.googleusercontent.com',
    iosBundleId: 'com.example.busManagement',
  );
}
