import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:gap/gap.dart';
import 'package:verifik/app/models/item_section.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/config/client_config.dart';
import 'package:verifik/app/utils/functions.dart';
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/text/text.dart';
import 'package:verifik/app/utils/verifik_ui.dart';
import 'package:verifik/app/widget/body_general_two.dart';
import 'package:verifik/app/widget/button.dart';
import 'package:verifik/app/widget/item_info.dart';
import 'package:verifik/app/widget/item_percent.dart';

part 'package:verifik/app/screen/result/_sections/info_left.dart';
part 'package:verifik/app/screen/result/_sections/info_right.dart';
part 'package:verifik/app/screen/result/_sections/section_info.dart';

class Result extends StatelessWidget {
  const Result({super.key});

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
