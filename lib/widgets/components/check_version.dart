import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pos/engine/engine.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Map<String, dynamic>?> getConfigVersion() async {
  final String url =
      '${Environment.baseAPIUrl()}config/version'; // Ganti dengan URL API Anda

  try {
    final response = await HttpClient().getUrl(Uri.parse(url));
    final httpClientResponse = await response.close();
    final responseBody =
        await httpClientResponse.transform(utf8.decoder).join();
    return jsonDecode(responseBody);
  } catch (e) {
    print('Error fetching config version: $e');
    return null;
  }
}

void checkVersion(BuildContext context) async {
  final data = await getConfigVersion();
  if (data != null) {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    print(data);
    if (data['current_version'].toString() == version) {
      // Versi sudah didukung
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              title: Text('Versi $version Tidak Didukung'),
              content: Text(
                'Versi aplikasi Anda tidak didukung. Silakan perbarui aplikasi Anda ke versi ${data['current_version']}',
              ),
              actions: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          print("ini url");
                          print(data['data']['link_playstore']);
                          await launcher(
                            data['link_playstore'] ?? '',
                          );
                        } else if (Platform.isIOS) {
                          await launcher(
                            data['link_appstore'] ?? '',
                          );
                        }
                      },
                      child: Text("Update Aplikasi"),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}



// // ignore_for_file: deprecated_member_use

// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:pos/data/api/services.dart';
// import 'package:pos/engine/engine.dart';

// void checkVersion(BuildContext context) async {
//   if (kIsWeb) {
//   } else {
//     final data = await ApiService.getConfigVersion(context);
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     String version = packageInfo.version;
//     log(data.data.toString());
//     if (data.currentVersion.toString() == version) {
//     } else {
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//             onWillPop: () async => false,
//             child: AlertDialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(32)),
//               title: Text('Versi $version Tidak Didukung'),
//               content: Text(
//                   'Versi aplikasi Anda tidak didukung. Silakan perbarui aplikasi Anda ke versi ${data.data?.currentVersion}'),
//               actions: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(24),
//                   child: Container(
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(24)),
//                     width: 200,
//                     height: 45,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           if (Platform.isAndroid) {
//                             launcher(data.data?.linkPlaystore ?? "");
//                           } else if (Platform.isIOS) {
//                             launcher(data.data?.linkAppstore ?? "");
//                           }
//                         },
//                         child: Text("Update Aplikasi")),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }
