import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase() async {
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCU6HiBa80eG-coDduyDXUlsSYZoILdb5E',
      appId: '1:205261320352:android:0ffb4967e5d6fbc29dd9c5',
      messagingSenderId: '205261320352',
      projectId: 'garapin-pos',
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
