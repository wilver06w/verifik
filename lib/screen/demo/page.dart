import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:verifik/screen/camera/page.dart';
import 'package:verifik/screen/demo/bloc/bloc.dart';
import 'package:verifik/screen/demo/repository.dart';
import 'package:verifik/screen/document/page.dart';
import 'package:verifik/screen/home/page.dart';
import 'package:verifik/screen/result/page.dart';
import 'package:verifik/screen/scanning/page.dart';
import 'package:verifik/utils/camera/bloc/bloc.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/config/client_config.dart';
import 'package:verifik/utils/functions.dart';
import 'package:verifik/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';
import 'package:verifik/utils/xigo_ui.dart';
import 'package:verifik/widget/item_circular.dart';

part 'package:verifik/screen/demo/_sections/app_bar.dart';
part 'package:verifik/screen/demo/_sections/body_pass.dart';
part 'package:verifik/screen/demo/_sections/bottom.dart';
part 'package:verifik/screen/demo/_sections/header_pass.dart';
part 'package:verifik/screen/demo/_sections/item_card.dart';
part 'package:verifik/screen/demo/_sections/options_card.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDemo>(
          create: (context) => BlocDemo(
            repository: Repository(
              xigoHttpClient: Modular.get<XigoHttpClient>(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => BlocCamera(),
        ),
      ],
      child: Scaffold(
        backgroundColor: XigoColors.backgroundColor,
        appBar: MyAppBar(
          imageCountryUrl: app.country.imageUrl,
        ),
        bottomNavigationBar: BodyBottom(app: app),
        body: BlocSelector<BlocDemo, DemoState, int>(
          selector: (state) {
            return state.model.numberPass;
          },
          builder: (context, state) {
            //TODO: Descomentar
            return state == 0 ? const BodyHome() : const BodyPass();
            //   return const BodyPass();
          },
        ),
      ),
    );
  }
}
