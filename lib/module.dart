import 'package:flutter/material.dart';
import 'package:verifik/config/app.dart';
import 'package:verifik/config/module.dart';
import 'package:verifik/utils/config/client_config.dart';
import 'package:verifik/utils/http/http_client.dart';
import 'package:verifik/utils/preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Preferences()),
      Bind<XigoHttpClient>(
        (i) => XigoHttpClient().getInstance(),
      ),
      Bind(
        (i) {
          return AppConfig()
            ..version = App.instance.version
            ..isWeb = App.instance.isWeb;
        },
        isLazy: false,
      ),
      Bind((i) => GlobalKey<NavigatorState>()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute('/', module: GlobalModule()),
    ];
  }
}
