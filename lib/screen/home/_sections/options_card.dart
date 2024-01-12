part of 'package:verifik/screen/home/page.dart';

class OptionsCards extends StatelessWidget {
  const OptionsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XigoResponsive.heightSizeByContext(
        context,
        pixels: 260,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: XigoResponsive.withSizeByContext(
          context,
          pixels: XigoSpacing.xl,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ItemCard(
            imageUrl: InitProyectUiValues.idInCardPng,
            title: InitProyectUiValues.scanYourIdDocument,
            passNumber: '1',
          ),
          Gap(
            XigoResponsive.withSizeByContext(
              context,
              pixels: XigoSpacing.xs,
            ),
          ),
          const ItemCard(
            imageUrl: InitProyectUiValues.x2Step2,
            title: InitProyectUiValues.obtainVerifyInformationExtracted,
            passNumber: '2',
          ),
          Gap(
            XigoResponsive.withSizeByContext(
              context,
              pixels: XigoSpacing.xs,
            ),
          ),
          const ItemCard(
            imageUrl: InitProyectUiValues.x2Step3,
            title: InitProyectUiValues.livenessDetection,
            passNumber: '3',
          ),
          Gap(
            XigoResponsive.withSizeByContext(
              context,
              pixels: XigoSpacing.xs,
            ),
          ),
          const ItemCard(
            imageUrl: InitProyectUiValues.x2Step4,
            title: InitProyectUiValues.getYourIdentityAuthenticatedWithinMinute,
            passNumber: '4',
          ),
        ],
      ),
    );
  }
}
