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

FirebaseOptions getFirebaseOptions() {
  return const FirebaseOptions(
    apiKey: 'AIzaSyDM0mKW8J3aQnJQnYw1daKZ-tZmT3VfiR0',
    appId: '1:633654595881:web:dd83556502d10ae5c22738',
    messagingSenderId: '633654595881',
    projectId: 'crisisconnect-2af2b',
    authDomain: 'crisisconnect-2af2b.firebaseapp.com',
    storageBucket: 'crisisconnect-2af2b.appspot.com',
    measurementId: 'G-CW4P2W9DH8',
  );
}

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDM0mKW8J3aQnJQnYw1daKZ-tZmT3VfiR0',
    appId: '1:633654595881:web:dd83556502d10ae5c22738',
    messagingSenderId: '633654595881',
    projectId: 'crisisconnect-2af2b',
    authDomain: 'crisisconnect-2af2b.firebaseapp.com',
    storageBucket: 'crisisconnect-2af2b.appspot.com',
    measurementId: 'G-CW4P2W9DH8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxXqKbUztaq00pmd97xUjhxHIFzpPAiGI',
    appId: '1:633654595881:android:55a957289a8c6b27c22738',
    messagingSenderId: '633654595881',
    projectId: 'crisisconnect-2af2b',
    storageBucket: 'crisisconnect-2af2b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeV8mz-JLkPJ3X_nCIQ0SVz_quBThgliU',
    appId: '1:633654595881:ios:0740affc55a2f11fc22738',
    messagingSenderId: '633654595881',
    projectId: 'crisisconnect-2af2b',
    storageBucket: 'crisisconnect-2af2b.appspot.com',
    iosClientId: '633654595881-pu7anfddhlf9elin0d0bn0300pf0t8g8.apps.googleusercontent.com',
    iosBundleId: 'com.example.crisisConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeV8mz-JLkPJ3X_nCIQ0SVz_quBThgliU',
    appId: '1:633654595881:ios:0740affc55a2f11fc22738',
    messagingSenderId: '633654595881',
    projectId: 'crisisconnect-2af2b',
    storageBucket: 'crisisconnect-2af2b.appspot.com',
    iosClientId: '633654595881-pu7anfddhlf9elin0d0bn0300pf0t8g8.apps.googleusercontent.com',
    iosBundleId: 'com.example.crisisConnect',
  );
}