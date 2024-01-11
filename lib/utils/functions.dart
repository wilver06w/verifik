import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:verifik/utils/xigo_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static Future<void> launchInBrowser({required String url}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<bool> validateDeviceId({required String deviceId}) async {
    try {
      return deviceId.contains('AppleWebKit');
    } catch (_) {
      return false;
    }
  }

  static Future<String> initPlatformState() async {
    try {
      String? deviceId = await PlatformDeviceId.getDeviceId;

      return (deviceId ?? '');
    } on PlatformException {
      return '';
    }
  }

  static Future<void> launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: InitProyectUiValues.meEmail,
      query: encodeQueryParameters(<String, String>{
        'subject': InitProyectUiValues.newOportunity,
        'body': InitProyectUiValues.reviewYourCatalog,
      }),
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch E-mail');
    }
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
