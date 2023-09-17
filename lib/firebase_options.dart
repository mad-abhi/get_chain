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
    apiKey: 'AIzaSyCC5l-oo7c99FVkXSu7B6v18mFONe7dwnM',
    appId: '1:486958765338:web:a08e916dd293e577dc88a3',
    messagingSenderId: '486958765338',
    projectId: 'getchatin-facfb',
    authDomain: 'getchatin-facfb.firebaseapp.com',
    storageBucket: 'getchatin-facfb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSLyxEGmlZ8x2PMOR7Rs4FTjEWl69hQDI',
    appId: '1:486958765338:android:c8eda81389b461ecdc88a3',
    messagingSenderId: '486958765338',
    projectId: 'getchatin-facfb',
    storageBucket: 'getchatin-facfb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDM_EOFc8Mr6NlbYdgjEIw7gaVTMrDr-Xk',
    appId: '1:486958765338:ios:209401f4085e4ed5dc88a3',
    messagingSenderId: '486958765338',
    projectId: 'getchatin-facfb',
    storageBucket: 'getchatin-facfb.appspot.com',
    iosBundleId: 'com.example.getChain',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDM_EOFc8Mr6NlbYdgjEIw7gaVTMrDr-Xk',
    appId: '1:486958765338:ios:c50559914f1f4b6ddc88a3',
    messagingSenderId: '486958765338',
    projectId: 'getchatin-facfb',
    storageBucket: 'getchatin-facfb.appspot.com',
    iosBundleId: 'com.example.getChain.RunnerTests',
  );
}
