import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

import 'launcher.dart';

class SendWhatsapp {
  static void send(String phone, String message) async {
    String uriDeep = "whatsapp://send?phone=$phone&text=$message";
    String uriLink = "https://wa.me/$phone?text=$message";
    if (kIsWeb) {
      launcher(uriLink);
    } else {
      if (await canLaunchUrl(Uri.parse(uriDeep))) {
        launchUrl(Uri.parse(uriDeep));
      } else {
        launcher(uriLink);
      }
    }
  }

  static void bookingProduct(String data) {
    String message = "Assalammualaikum wr wb, saya tertarik booking, "
        "dan ingin informasi lebih jelas tentang: ${data} "
        "- ${data}.";
    int? phone = 0812313;
    if (phone != null) {
      send('$phone', message);
    } else {
      throw 'Tidak ada nomor wa PPIU';
    }
  }

  static void contactUs(int? phone) {
    String message = "Assalammualaikum, saya membutuhkan informasi mengenai: ";
    if (phone != null) {
      send('$phone', message);
    } else {
      throw 'Tidak ada nomor wa PPIU';
    }
  }
}
