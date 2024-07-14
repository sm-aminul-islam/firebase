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
    apiKey: 'AIzaSyDNVVXqcZ77lLoukiBlcXGNnbPYIVJGS8Q',
    appId: '1:91041422652:web:355669296799a12acbd239',
    messagingSenderId: '91041422652',
    projectId: 'fir-demo-6cce9',
    authDomain: 'fir-demo-6cce9.firebaseapp.com',
    storageBucket: 'fir-demo-6cce9.appspot.com',
    measurementId: 'G-Z0MDW4XJME',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhOLICMB1IZZq3HUitxDB1qlJ0A7MoyHs',
    appId: '1:91041422652:android:514611d916efa584cbd239',
    messagingSenderId: '91041422652',
    projectId: 'fir-demo-6cce9',
    storageBucket: 'fir-demo-6cce9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9NUMGvV2u-RKA7lN34Kar4DpKJtCols0',
    appId: '1:91041422652:ios:da99889856df0ec0cbd239',
    messagingSenderId: '91041422652',
    projectId: 'fir-demo-6cce9',
    storageBucket: 'fir-demo-6cce9.appspot.com',
    iosBundleId: 'com.example.firebaseDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9NUMGvV2u-RKA7lN34Kar4DpKJtCols0',
    appId: '1:91041422652:ios:da99889856df0ec0cbd239',
    messagingSenderId: '91041422652',
    projectId: 'fir-demo-6cce9',
    storageBucket: 'fir-demo-6cce9.appspot.com',
    iosBundleId: 'com.example.firebaseDemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDNVVXqcZ77lLoukiBlcXGNnbPYIVJGS8Q',
    appId: '1:91041422652:web:7650d7385772d518cbd239',
    messagingSenderId: '91041422652',
    projectId: 'fir-demo-6cce9',
    authDomain: 'fir-demo-6cce9.firebaseapp.com',
    storageBucket: 'fir-demo-6cce9.appspot.com',
    measurementId: 'G-KHPK81QK7M',
  );
}
