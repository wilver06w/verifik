part of 'package:verifik/screen/result/page.dart';

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
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return SectionInfo(
              title: InitProyectUiValues.generalInformation,
              items: [
                ItemSection(
                  title: InitProyectUiValues.device,
                  subTitle: app.infoDevice?.platform ?? '',
                ),
                ItemSection(
                  title: InitProyectUiValues.lenguaje,
                  subTitle: app.infoDevice?.language ?? '',
                ),
                ItemSection(
                  title: InitProyectUiValues.userAgent,
                  subTitle: app.infoDevice?.userAgent ?? '',
                ),
              ],
            );
          },
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemPercent(
                  title: InitProyectUiValues.livenessScore,
                  percent: state.model.compare?.data.result.score ?? 0.0,
                  colorsProgress: XigoColors.rybBlue,
                ),
                Gap(
                  XigoResponsive.withSizeByContext(
                    context,
                    pixels: XigoSpacing.xs,
                  ),
                ),
                ItemPercent(
                  title: InitProyectUiValues.matchScore,
                  percent:
                      state.model.liveness?.data.result.livenessScore ?? 0.0,
                  colorsProgress: XigoColors.maximumRed,
                ),
              ],
            );
          },
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.xl,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return SectionInfo(
              title: InitProyectUiValues.livenessMatchResults,
              items: [
                ItemSection(
                  title: InitProyectUiValues.livenessScore,
                  subTitle:
                      '${Functions.convertirAInt(value: state.model.liveness?.data.result.livenessScore ?? 0.0)}',
                ),
                ItemSection(
                  title: InitProyectUiValues.livenessPassed,
                  subTitle:
                      '${(state.model.liveness?.data.result.passed ?? false)}',
                ),
                ItemSection(
                  title: InitProyectUiValues.minimumLivenessScore,
                  subTitle:
                      '${Functions.convertirAInt(value: state.model.liveness?.data.livenessMinScore ?? 0.0)}',
                ),
                ItemSection(
                  title: InitProyectUiValues.matchScore,
                  subTitle:
                      '${Functions.convertirAInt(value: state.model.compare?.data.result.score ?? 0.0)}',
                ),
              ],
            );
          },
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
        Column(
          children: [
            Button(
              title: InitProyectUiValues.restartDemo,
              backgroundColor: XigoColors.majorelleBlue,
              onPressed: () {
                context.read<BlocDemo>().add(
                      const ChangePassNumberEvent(
                        passNumber: 0,
                      ),
                    );
              },
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
