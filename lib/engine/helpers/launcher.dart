import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

launcher(
  String url, {
  String suffix = 'https://',
  bool ignoreSuffix = true,
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  if (ignoreSuffix) {
    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url), mode: mode);
    } else {
      log("Error launch URL: $url");
    }
  } else {
    if (await canLaunchUrl(Uri.parse('$suffix$url'))) {
      launchUrl(Uri.parse('$suffix$url'), mode: mode);
    } else {
      if (await canLaunchUrl(Uri.parse(url))) {
        launchUrl(Uri.parse(url), mode: mode);
      } else {
        log("Error launch URL: $url");
      }
    }
  }
}
