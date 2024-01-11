import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:gap/gap.dart';
import 'package:verifik/models/item_section.dart';
import 'package:verifik/screen/demo/bloc/bloc.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/config/client_config.dart';
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';
import 'package:verifik/utils/xigo_ui.dart';
import 'package:verifik/widget/body_general_two.dart';
import 'package:verifik/widget/button.dart';
import 'package:verifik/widget/item_info.dart';

part 'package:verifik/screen/document/_sections/info_left.dart';
part 'package:verifik/screen/document/_sections/info_right.dart';
part 'package:verifik/screen/document/_sections/section_info.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BodyGeneralTwo(
      bgColorRight: Colors.white,
      widgetLeft: const InfoLeft(),
      widgetRight: InfoRight(
        app: app,
      ),
    );
  }
}
