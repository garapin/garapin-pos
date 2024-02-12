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
        apiKey: 'AIzaSyCU6HiBa80eG-coDduyDXUlsSYZoILdb5E',
        appId: '1:205261320352:ios:204ecb66f17f3e329dd9c5',
        messagingSenderId: '205261320352',
        projectId: 'pos-3c2be',
      ),
    );
  } else {
    throw UnsupportedError('This platform is not supported');
  }
}
