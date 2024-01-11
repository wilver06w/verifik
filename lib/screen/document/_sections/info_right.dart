part of 'package:verifik/screen/document/page.dart';

class InfoRight extends StatelessWidget {
  const InfoRight({
    super.key,
    required this.app,
  });

  final AppConfig app;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          textAlign: TextAlign.start,
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
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return const SectionInfo(
              title: InitProyectUiValues.userEstimatedLocation,
              items: [],
            );
          },
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.md,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Button(
                title: InitProyectUiValues.scanAgain,
                onPressed: () {
                  context.read<BlocDemo>().add(
                        const ChangePassNumberEvent(
                          passNumber: 1,
                        ),
                      );
                },
                colorText: XigoColors.majorelleBlue,
                borderColor: XigoColors.azureishWhite,
              ),
            ),
            Gap(
              XigoResponsive.withSizeByContext(
                context,
                pixels: XigoSpacing.md,
              ),
            ),
            Expanded(
              child: Button(
                title: InitProyectUiValues.continu,
                backgroundColor: XigoColors.majorelleBlue,
                onPressed: () {
                  context.read<BlocDemo>().add(
                        const ChangePassNumberEvent(
                          passNumber: 3,
                        ),
                      );
                },
              ),
            ),
          ],
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.md,
          ),
        ),
      ],
    );
  }
}
