import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase() async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCQFDybRHbzPHRvq0zuXFY0Fdosl7fI5YI',
      appId: '1:921694687850:android:222aa5d7d6e23132acb013',
      messagingSenderId: '921694687850',
      projectId: 'armory-3c2be',
    ));
  } else if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyANkol1urFuu3v1iJgnui9K6Xdg-rxlSmw',
        appId: '1:921694687850:ios:f2999ffed1cd3a25acb013',
        messagingSenderId: '921694687850',
        projectId: 'armory-3c2be',
      ),
    );
  } else {
    throw UnsupportedError('This platform is not supported');
  }
}
