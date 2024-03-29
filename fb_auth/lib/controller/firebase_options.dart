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
    apiKey: 'AIzaSyDntDha0-fpyTbXVJ1AcehKffguSqdAIxs',
    appId: '1:226438241533:web:f23b38e484925421893294',
    messagingSenderId: '226438241533',
    projectId: 'auth-demo-0',
    authDomain: 'auth-demo-0.firebaseapp.com',
    storageBucket: 'auth-demo-0.appspot.com',
    measurementId: 'G-E3VRPPR47H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAj72uP4zqhSluRI4N1owUvJ6n_aV24nc',
    appId: '1:226438241533:android:11ff58c945565bdb893294',
    messagingSenderId: '226438241533',
    projectId: 'auth-demo-0',
    storageBucket: 'auth-demo-0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAi0we9CAO5ectSU1AyE9ubsD3HoNZ17qY',
    appId: '1:226438241533:ios:d8caf2f5d4a5ab01893294',
    messagingSenderId: '226438241533',
    projectId: 'auth-demo-0',
    storageBucket: 'auth-demo-0.appspot.com',
    iosClientId: '226438241533-85cdd5qr3b1i3bmrs2oiudkkjlpj8j21.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAi0we9CAO5ectSU1AyE9ubsD3HoNZ17qY',
    appId: '1:226438241533:ios:fca528fd7ae5e143893294',
    messagingSenderId: '226438241533',
    projectId: 'auth-demo-0',
    storageBucket: 'auth-demo-0.appspot.com',
    iosClientId: '226438241533-ong646pfqiok7611ulqrdv64nju5smqf.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuthentication.RunnerTests',
  );
}
