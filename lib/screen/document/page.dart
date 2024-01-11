import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
import 'package:verifik/widget/item_info.dart';

part 'package:verifik/screen/document/_sections/info_left.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BodyGeneralTwo(
      bgColorRight: Colors.white,
      widgetLeft: const InfoLeft(),
      widgetRight: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: XigoSpacing.md,
        ),
        children: [
          Gap(
            XigoResponsive.heightSizeByContext(
              context,
              pixels: XigoSpacing.xxl,
            ),
          ),
          XigoText.fontSizeCustom(
            label: InitProyectUiValues.generalInformation,
            color: XigoColors.rybBlue.withAlpha(77),
            textAlign: TextAlign.center,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
          ItemInfo(
            title: InitProyectUiValues.device,
            subTitle: app.deviceId,
          ),
          ItemInfo(
            title: InitProyectUiValues.lenguaje,
            subTitle: app.deviceId,
          ),
          ItemInfo(
            title: InitProyectUiValues.userAgent,
            subTitle: app.deviceId,
            isLast: true,
          ),
          BlocBuilder<BlocDemo, DemoState>(
            builder: (context, state) {
              return SectionInfo(
                title: InitProyectUiValues.scanStudioDocumentExtraction,
                items: [
                  ItemSection(
                    title: InitProyectUiValues.documenType,
                    subTitle:
                        state.model.documentDetails?.data.studio.documentType ??
                            '',
                  ),
                  ItemSection(
                    title: InitProyectUiValues.documentNumber,
                    subTitle: state.model.documentDetails?.data.studio
                            .ocrExtraction.documentNumber ??
                        '',
                  ),
                  ItemSection(
                    title: InitProyectUiValues.firstName,
                    subTitle: state.model.documentDetails?.data.studio
                            .ocrExtraction.firstName ??
                        '',
                  ),
                  if ((state.model.documentDetails?.data.studio.ocrExtraction
                              .fullName ??
                          '')
                      .isNotEmpty) ...[
                    ItemSection(
                      title: InitProyectUiValues.fullName,
                      subTitle: state.model.documentDetails?.data.studio
                              .ocrExtraction.fullName ??
                          '',
                    ),
                  ],
                ],
              );
            },
          ),
          BlocBuilder<BlocDemo, DemoState>(
            builder: (context, state) {
              return SectionInfo(
                title: InitProyectUiValues.scanPromptDocumentExtraction,
                items: [
                  ItemSection(
                    title: InitProyectUiValues.documenType,
                    subTitle:
                        state.model.documentDetails?.data.prompt.documentType ??
                            '',
                  ),
                  ItemSection(
                    title: InitProyectUiValues.documentNumber,
                    subTitle: state.model.documentDetails?.data.prompt
                            .ocrExtraction.documentNumber ??
                        '',
                  ),
                  ItemSection(
                    title: InitProyectUiValues.firstName,
                    subTitle: state.model.documentDetails?.data.prompt
                            .ocrExtraction.firstName ??
                        '',
                  ),
                  if ((state.model.documentDetails?.data.prompt.ocrExtraction
                              .fullName ??
                          '')
                      .isNotEmpty) ...[
                    ItemSection(
                      title: InitProyectUiValues.fullName,
                      subTitle: state.model.documentDetails?.data.prompt
                              .ocrExtraction.fullName ??
                          '',
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionInfo extends StatelessWidget {
  const SectionInfo({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<ItemSection> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        XigoText.fontSizeCustom(
          label: title,
          color: XigoColors.rybBlue.withAlpha(77),
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        ...List.generate(
          items.length,
          (index) {
            final item = items[index];
            return ItemInfo(
              title: item.title,
              subTitle: item.subTitle,
              isLast: items.last == item,
            );
          },
        ),
      ],
    );
  }
}
