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
    apiKey: 'AIzaSyBVfsdhLlWJpj5waOYmuEB7ddsrgnccojI',
    appId: '1:1054568346467:web:717d623b32285a469f9956',
    messagingSenderId: '1054568346467',
    projectId: 'chaibunf-311ce',
    authDomain: 'chaibunf-311ce.firebaseapp.com',
    storageBucket: 'chaibunf-311ce.appspot.com',
    measurementId: 'G-CHYQ1VW1ZZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYIP0Znu_rSGIm82iWLtjzwS86qMS4PL0',
    appId: '1:1054568346467:android:ed03046c5f1f1abd9f9956',
    messagingSenderId: '1054568346467',
    projectId: 'chaibunf-311ce',
    storageBucket: 'chaibunf-311ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR1Oy5VvhJRl8CNB7_XiqUKVExI_RSplo',
    appId: '1:1054568346467:ios:24ac9265e5a43f769f9956',
    messagingSenderId: '1054568346467',
    projectId: 'chaibunf-311ce',
    storageBucket: 'chaibunf-311ce.appspot.com',
    iosClientId:
        '1054568346467-0s43ee4vu90udoaa641eo6tnn9s5udj2.apps.googleusercontent.com',
    iosBundleId: 'com.chaibun.newcbapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR1Oy5VvhJRl8CNB7_XiqUKVExI_RSplo',
    appId: '1:1054568346467:ios:24ac9265e5a43f769f9956',
    messagingSenderId: '1054568346467',
    projectId: 'chaibunf-311ce',
    storageBucket: 'chaibunf-311ce.appspot.com',
    iosClientId:
        '1054568346467-0s43ee4vu90udoaa641eo6tnn9s5udj2.apps.googleusercontent.com',
    iosBundleId: 'com.chaibun.newcbapp',
  );
}
