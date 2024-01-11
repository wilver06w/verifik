import 'package:verifik/utils/functions.dart';
import 'package:verifik/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class App {
  static final instance = App._();

  final navigatorKey = GlobalKey<NavigatorState>();

  Map<String, dynamic> config = {};
  String version = '';
  String deviceId = '';
  bool isWeb = false;

  App._();

  Future<void> init() async {
    Intl.defaultLocale = 'es';

    final prefs = Preferences();

    await prefs.init();

    await _setPreferredOrientations();

    try {
      PackageInfo dataPlatform = await PackageInfo.fromPlatform();
      version = dataPlatform.version;
      deviceId = await Functions.initPlatformState();
      isWeb = await Functions.validateDeviceId(
        deviceId: deviceId,
      );
    } catch (_) {}
  }

  Future<void> _setPreferredOrientations() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
