import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:verifik/app/screen/camera/page.dart';
import 'package:verifik/app/screen/demo/bloc/bloc.dart';
import 'package:verifik/app/screen/demo/repository.dart';
import 'package:verifik/app/screen/document/page.dart';
import 'package:verifik/app/screen/home/page.dart';
import 'package:verifik/app/screen/result/page.dart';
import 'package:verifik/app/screen/scanning/page.dart';
import 'package:verifik/app/utils/camera/bloc/bloc.dart';
import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/config/client_config.dart';
import 'package:verifik/app/utils/functions.dart';
import 'package:verifik/app/utils/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/text/text.dart';
import 'package:verifik/app/utils/verifik_ui.dart';
import 'package:verifik/app/widget/item_circular.dart';

part 'package:verifik/app/screen/demo/_sections/app_bar.dart';
part 'package:verifik/app/screen/demo/_sections/body_pass.dart';
part 'package:verifik/app/screen/demo/_sections/bottom.dart';
part 'package:verifik/app/screen/demo/_sections/header_pass.dart';
part 'package:verifik/app/screen/demo/_sections/item_card.dart';
part 'package:verifik/app/screen/demo/_sections/options_card.dart';

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
              verifikHttpClient: Modular.get<VerifikHttpClient>(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => BlocCamera(),
        ),
      ],
      child: Scaffold(
        backgroundColor: VerifikColors.backgroundColor,
        appBar: MyAppBar(
          imageCountryUrl: app.country.imageUrl,
        ),
        bottomNavigationBar: BodyBottom(app: app),
        body: BlocSelector<BlocDemo, DemoState, int>(
          selector: (state) {
            return state.model.numberPass;
          },
          builder: (context, state) {
            return state == 0 ? const BodyHome() : const BodyPass();
          },
        ),
      ),
    );
  }
}
