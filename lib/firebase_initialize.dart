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
        apiKey: 'AIzaSyBqiPAO8yWb_Gy3RqNB5F9Ryow0TZPMp1k',
        appId: '1:205261320352:ios:baba5bb454c83c6b9dd9c5',
        messagingSenderId: '205261320352',
        projectId: 'garapin-pos',
      ),
    );
  } else {
    throw UnsupportedError('This platform is not supported');
  }
}
