import 'package:flutter_modular/flutter_modular.dart';
import 'package:verifik/screen/demo/page.dart' as demo;

class GlobalModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const demo.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
