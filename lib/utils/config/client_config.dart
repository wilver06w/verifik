library mobile_client_config;

import 'package:flutter_modular/flutter_modular.dart';
import 'package:verifik/models/language.dart';
import 'package:verifik/utils/config/countries.dart';
import 'package:verifik/utils/preferences.dart';

class AppConfig {
  factory AppConfig() {
    return _singleton ?? AppConfig._();
  }

  AppConfig._() {
    final prefsCountry = Modular.get<Preferences>().language;

    _country = countries.firstWhere(
      (c) => c.code == (prefsCountry.isEmpty ? 'EN' : prefsCountry),
      orElse: () => countries.first,
    );
  }

  static AppConfig? _singleton;

  final bool isProd = (const bool.fromEnvironment('dart.vm.product'));
  bool isWeb = false;
  late Language _country;

  String version = '0';
  Language get country => _country;

  set country(Language country) {
    Modular.get<Preferences>().language =
        country.code.isEmpty ? 'EN' : country.code;
    _country = country;
  }

  List<Language> get countries {
    return Countries().all;
  }
}
