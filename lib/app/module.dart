import 'package:flutter/material.dart';
import 'package:verifik/app/config/app.dart';
import 'package:verifik/app/config/module.dart';
import 'package:verifik/app/utils/camera/bloc/bloc.dart';
import 'package:verifik/app/utils/config/client_config.dart';
import 'package:verifik/app/utils/http/http_client.dart';
import 'package:verifik/app/utils/preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Preferences()),
      Bind<XigoHttpClient>(
        (i) => XigoHttpClient().getInstance(),
      ),
      Bind.lazySingleton(
        (i) => BlocCamera(),
      ),
      Bind(
        (i) {
          return AppConfig()
            ..version = App.instance.version
            ..infoDevice = App.instance.infoDevice;
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
