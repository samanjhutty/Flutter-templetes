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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD8b2qrHuNgQQyrKTfLF-bsAD5-nQJ6krQ',
    appId: '1:941993322891:web:edef4087adb47dba3b278e',
    messagingSenderId: '941993322891',
    projectId: 'realtime-db-demo-22e4b',
    authDomain: 'realtime-db-demo-22e4b.firebaseapp.com',
    storageBucket: 'realtime-db-demo-22e4b.appspot.com',
    measurementId: 'G-3YH46CJ7JB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOphTotoOwvB_jqh5xHbI6PAHcx3xStOk',
    appId: '1:941993322891:android:950b09641c9b19fb3b278e',
    messagingSenderId: '941993322891',
    projectId: 'realtime-db-demo-22e4b',
    storageBucket: 'realtime-db-demo-22e4b.appspot.com',
  );
}
