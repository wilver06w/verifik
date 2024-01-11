import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:octo_image/octo_image.dart';
import 'package:verifik/screen/demo/bloc/bloc.dart';
import 'package:verifik/screen/demo/repository.dart';
import 'package:verifik/screen/document/page.dart';
import 'package:verifik/screen/scanning/page.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/config/client_config.dart';
import 'package:verifik/utils/functions.dart';
import 'package:verifik/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';
import 'package:verifik/utils/verifik_loading.dart';
import 'package:verifik/utils/xigo_loading_circle.dart';
import 'package:verifik/utils/xigo_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verifik/widget/body_general_two.dart';
import 'package:verifik/widget/item_circular.dart';
import 'package:verifik/widget/button.dart';
import 'package:verifik/utils/camera/bloc/bloc.dart';

part 'package:verifik/screen/demo/_sections/header.dart';
part 'package:verifik/screen/demo/_sections/app_bar.dart';
part 'package:verifik/screen/demo/_sections/bottom.dart';
part 'package:verifik/screen/demo/_sections/item_card.dart';
part 'package:verifik/screen/demo/_sections/options_card.dart';
part 'package:verifik/screen/demo/_sections/body_home.dart';
part 'package:verifik/screen/demo/_sections/body_pass.dart';
part 'package:verifik/screen/demo/_sections/header_pass.dart';

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
            //TODO: Creo que hay que remover, no hay necesidad de llamarlo.
            // httpClient: Modular.get<XigoHttpClient>(),
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
            //return state == 0 ? const BodyHome() : const BodyPass();
            return const BodyPass();
          },
        ),
      ),
    );
  }
}

//TODO: Remover
class ItemUrl extends StatefulWidget {
  const ItemUrl({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<ItemUrl> createState() => _ItemUrlState();
}

class _ItemUrlState extends State<ItemUrl> {
  bool isOn = false;
  StreamController<bool> streamController = StreamController<bool>();

  @override
  void initState() {
    streamController.add(isOn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        streamController.add(value);
      },
      child: StreamBuilder<bool>(
        stream: streamController.stream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: (snapshot.data ?? false)
                  ? XigoColors.containerSelected
                  : Colors.white,
              border: Border.all(
                color: (snapshot.data ?? false)
                    ? Colors.white
                    : XigoColors.containerBorder,
              ),
            ),
            padding: const EdgeInsets.all(
              InitProyectUiValues.spacingEight,
            ),
            child: SvgPicture.asset(
              InitProyectUiValues.svgIconGitHub,
              height: 20,
              width: 20,
              colorFilter: const ColorFilter.mode(
                Colors.blue,
                BlendMode.srcIn,
              ),
              // color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
