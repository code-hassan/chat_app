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
    apiKey: 'AIzaSyAxZAwpDl5Bcm5-ek2VVTdQTKdrQd2df9o',
    appId: '1:852397747930:web:ae105111c98728e5263fe3',
    messagingSenderId: '852397747930',
    projectId: 'flutterfire-demo-22241',
    authDomain: 'flutterfire-demo-22241.firebaseapp.com',
    databaseURL: 'https://flutterfire-demo-22241-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfire-demo-22241.appspot.com',
    measurementId: 'G-FYSNZXN9Q7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbaq9eG8e0y6sCx_0h4EZVuXoqntb14rM',
    appId: '1:852397747930:android:fef8fcacc3bb0be9263fe3',
    messagingSenderId: '852397747930',
    projectId: 'flutterfire-demo-22241',
    databaseURL: 'https://flutterfire-demo-22241-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfire-demo-22241.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnqKWxIgAsM1YL_RERS1AB8FrTMU3tEIs',
    appId: '1:852397747930:ios:46aa2d37f3e8715f263fe3',
    messagingSenderId: '852397747930',
    projectId: 'flutterfire-demo-22241',
    databaseURL: 'https://flutterfire-demo-22241-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfire-demo-22241.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnqKWxIgAsM1YL_RERS1AB8FrTMU3tEIs',
    appId: '1:852397747930:ios:6f95b4e913c96579263fe3',
    messagingSenderId: '852397747930',
    projectId: 'flutterfire-demo-22241',
    databaseURL: 'https://flutterfire-demo-22241-default-rtdb.firebaseio.com',
    storageBucket: 'flutterfire-demo-22241.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
