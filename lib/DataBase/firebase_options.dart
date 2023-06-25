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
    apiKey: 'AIzaSyCCReephoihiMpAcTTMRlCpXSu7ksMTUTQ',
    appId: '1:766399146946:web:00498caa7dd737e545c45b',
    messagingSenderId: '766399146946',
    projectId: 'solar-system-700f3',
    authDomain: 'solar-system-700f3.firebaseapp.com',
    storageBucket: 'solar-system-700f3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgT9H3ZdqOukrylaY5OcURZMEsjfeyiWU',
    appId: '1:766399146946:android:eaa2bab23bf50ae645c45b',
    messagingSenderId: '766399146946',
    projectId: 'solar-system-700f3',
    storageBucket: 'solar-system-700f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2IHvUTXEmz6LcIuX_EzTzQ7Hca7zxIOo',
    appId: '1:766399146946:ios:c7b37f9c443bc46345c45b',
    messagingSenderId: '766399146946',
    projectId: 'solar-system-700f3',
    storageBucket: 'solar-system-700f3.appspot.com',
    iosClientId: '766399146946-l9g7juftrqe6aigr8gq8rlji5rjdvqfq.apps.googleusercontent.com',
    iosBundleId: 'com.example.solarSystemapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2IHvUTXEmz6LcIuX_EzTzQ7Hca7zxIOo',
    appId: '1:766399146946:ios:6e176488c73e9de245c45b',
    messagingSenderId: '766399146946',
    projectId: 'solar-system-700f3',
    storageBucket: 'solar-system-700f3.appspot.com',
    iosClientId: '766399146946-i0iqnk28p04ecbeopb8qrqorpppo7gpe.apps.googleusercontent.com',
    iosBundleId: 'com.example.solarSystemapp.RunnerTests',
  );
}
