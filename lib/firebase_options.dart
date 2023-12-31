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
    apiKey: 'AIzaSyDhrtlMy7OXNDXBWfcX7m0lAAqcueVDKl0',
    appId: '1:430189687721:web:c5f6dab7ae324812c48ab8',
    messagingSenderId: '430189687721',
    projectId: 'inovasi-budaya',
    authDomain: 'inovasi-budaya.firebaseapp.com',
    storageBucket: 'inovasi-budaya.appspot.com',
    measurementId: 'G-1MRW599E8J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDg8nrXFB6j4P4xDtAjNyr-rIIvFWptdJA',
    appId: '1:430189687721:android:e7aea1f3f5bf94a3c48ab8',
    messagingSenderId: '430189687721',
    projectId: 'inovasi-budaya',
    storageBucket: 'inovasi-budaya.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZrjXMyusF2f4oD8GVNuEPkagBDSX7pSk',
    appId: '1:430189687721:ios:d2aab7cbbae83bc2c48ab8',
    messagingSenderId: '430189687721',
    projectId: 'inovasi-budaya',
    storageBucket: 'inovasi-budaya.appspot.com',
    iosClientId: '430189687721-ubudapuulsn2bv67ro5eh310nbddqiai.apps.googleusercontent.com',
    iosBundleId: 'com.example.inovasiBudaya',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZrjXMyusF2f4oD8GVNuEPkagBDSX7pSk',
    appId: '1:430189687721:ios:d2aab7cbbae83bc2c48ab8',
    messagingSenderId: '430189687721',
    projectId: 'inovasi-budaya',
    storageBucket: 'inovasi-budaya.appspot.com',
    iosClientId: '430189687721-ubudapuulsn2bv67ro5eh310nbddqiai.apps.googleusercontent.com',
    iosBundleId: 'com.example.inovasiBudaya',
  );
}
