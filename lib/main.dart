import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'engine/base/app.dart';
import 'engine/configs/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCQFDybRHbzPHRvq0zuXFY0Fdosl7fI5YI',
    appId: '1:921694687850:android:222aa5d7d6e23132acb013',
    messagingSenderId: '921694687850',
    projectId: 'armory-3c2be',
  ));

  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class InitialApps {
  static start() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    await setup();
    await firebaseInit();
  }

  static setup() async {
    await GetStorage.init();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Environment.appVersion = packageInfo.version;
    Environment.appBuildNumber = packageInfo.buildNumber;

    initializeDateFormatting(Environment.currentLanguages.languageCode);

    observers.clear();
    observers.add(RouteObserver<PageRoute>());
  }

  static firebaseInit() async {
    // Initialize Firebase
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
