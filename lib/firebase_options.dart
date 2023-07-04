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
    apiKey: 'AIzaSyAoX9-0dOPv5bCp0XgHASnsuOKuzh52IxU',
    appId: '1:599880746632:web:3fc7617a86d2e0c8da013d',
    messagingSenderId: '599880746632',
    projectId: 'fir-bloc-faaf2',
    authDomain: 'fir-bloc-faaf2.firebaseapp.com',
    storageBucket: 'fir-bloc-faaf2.appspot.com',
    measurementId: 'G-S4ZLPDGLWD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNT7FkAmylgrpULeWHzg-SRS7nQNFn334',
    appId: '1:599880746632:android:9fce0f05ff120ae8da013d',
    messagingSenderId: '599880746632',
    projectId: 'fir-bloc-faaf2',
    storageBucket: 'fir-bloc-faaf2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFLykHfjWISo9XkgbSjsrBbUnT5rt17N0',
    appId: '1:599880746632:ios:8a8327cb213aa967da013d',
    messagingSenderId: '599880746632',
    projectId: 'fir-bloc-faaf2',
    storageBucket: 'fir-bloc-faaf2.appspot.com',
    iosClientId: '599880746632-36v4oesrrapcn1tdr5krsdgdp2jqth8h.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFLykHfjWISo9XkgbSjsrBbUnT5rt17N0',
    appId: '1:599880746632:ios:8a8327cb213aa967da013d',
    messagingSenderId: '599880746632',
    projectId: 'fir-bloc-faaf2',
    storageBucket: 'fir-bloc-faaf2.appspot.com',
    iosClientId: '599880746632-36v4oesrrapcn1tdr5krsdgdp2jqth8h.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );
}
