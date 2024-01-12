part of 'package:verifik/screen/result/page.dart';

class InfoLeft extends StatelessWidget {
  const InfoLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.xxl,
          ),
        ),
        XigoText.fontSizeCustom(
          label: InitProyectUiValues.selfie,
          color: XigoColors.rybBlue.withAlpha(77),
          textAlign: TextAlign.center,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.xs,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return state.model.imageSelfie != null
                ? Image.memory(
                    state.model.imageSelfie!,
                    width: XigoResponsive.withSizeByContext(
                      context,
                      pixels: 350,
                    ),
                    height: XigoResponsive.heightSizeByContext(
                      context,
                      pixels: 197,
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.lg,
          ),
        ),
        XigoText.fontSizeCustom(
          label: InitProyectUiValues.documentScanned,
          color: XigoColors.rybBlue.withAlpha(77),
          textAlign: TextAlign.center,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.lg,
          ),
        ),
        XigoText.fontSizeCustom(
          label: InitProyectUiValues.frontSide,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.xs,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return state.model.imageScanned != null
                ? Image.memory(
                    state.model.imageScanned!,
                    width: XigoResponsive.withSizeByContext(
                      context,
                      pixels: 350,
                    ),
                    height: XigoResponsive.heightSizeByContext(
                      context,
                      pixels: 197,
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
