part of 'package:verifik/_childrens/demo/page.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.network(
            InitProyectUiValues.businessWomanImage,
            height: XigoResponsive.heightSizeByContext(context, pixels: 470),
          ),
        ),
        ListView(
          padding: const EdgeInsets.symmetric(
            vertical: InitProyectUiValues.spacingXSL,
            horizontal: InitProyectUiValues.spacingXSL,
          ),
          children: [
            SvgPicture.network(
              InitProyectUiValues.stepOneLogo,
              width: XigoResponsive.withSizeByContext(context, pixels: 130),
              height: XigoResponsive.heightSizeByContext(context, pixels: 60),
            ),
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.lg,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: XigoResponsive.withSizeByContext(
                  context,
                  pixels: XigoSpacing.xxl,
                ),
              ),
              child: Column(
                children: [
                  XigoText.fontSizeCustom(
                    label: InitProyectUiValues
                        .exploreFutureIdentityValidationWithVerifik,
                    color: XigoColors.rybBlue,
                    textAlign: TextAlign.center,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                  Gap(
                    XigoResponsive.heightSizeByContext(
                      context,
                      pixels: XigoSpacing.md,
                    ),
                  ),
                  XigoText.body(
                    label: InitProyectUiValues.textWeFeatureCutting,
                    color: XigoColors.catalinaBlue.withOpacity(0.60),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    XigoResponsive.heightSizeByContext(
                      context,
                      pixels: XigoSpacing.md,
                    ),
                  ),
                  XigoText.body(
                    label: InitProyectUiValues.discoverVerifik,
                    color: XigoColors.catalinaBlue.withOpacity(0.698),
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    XigoResponsive.heightSizeByContext(
                      context,
                      pixels: XigoSpacing.md,
                    ),
                  ),
                ],
              ),
            ),
            const OptionsCards(),
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.xl,
              ),
            ),
            Column(
              children: [
                Button(
                  title: InitProyectUiValues.startDemo,
                  backgroundColor: XigoColors.majorelleBlue,
                  onPressed: () {
                    context.read<BlocDemo>().add(
                          const ChangePassNumberEvent(
                            passNumber: 1,
                          ),
                        );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
