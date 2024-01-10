part of 'package:verifik/_childrens/demo/page.dart';

class BodyPass extends StatelessWidget {
  const BodyPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: XigoResponsive.heightSizeByContext(
            context,
            pixels: 40,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.10),
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: const Offset(
                  5,
                  3,
                ),
              ),
            ],
          ),
          child: BlocSelector<BlocDemo, DemoState, int>(
            selector: (state) {
              return state.model.numberPass;
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: XigoSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ItemPass(
                      passNumber: 1,
                      passSelected: state,
                      title: InitProyectUiValues.idScanning,
                    ),
                    ItemPass(
                      passNumber: 2,
                      passSelected: state,
                      title: InitProyectUiValues.documentDetails,
                    ),
                    ItemPass(
                      passNumber: 3,
                      passSelected: state,
                      title: InitProyectUiValues.livenessCheck,
                    ),
                    ItemPass(
                      passNumber: 4,
                      passSelected: state,
                      title: InitProyectUiValues.results,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ItemID(
                  title: InitProyectUiValues.uploadedIdDocument,
                  imageUrl: InitProyectUiValues.idInCardPng,
                  titleButton: InitProyectUiValues.uploadFile,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: ItemID(
                  isBackgroundWhite: true,
                  title: InitProyectUiValues.scanIdDocument,
                  imageUrl: InitProyectUiValues.idInCardPng,
                  titleButton: InitProyectUiValues.startScanning,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemID extends StatelessWidget {
  const ItemID({
    super.key,
    this.isBackgroundWhite = false,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
    required this.titleButton,
  });

  final bool isBackgroundWhite;
  final String title;
  final String imageUrl;
  final String titleButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: isBackgroundWhite ? Colors.white : null,
        child: Column(
          children: [
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.xxl,
              ),
            ),
            XigoText.fontSizeCustom(
              label: title,
              color: XigoColors.rybBlue,
              textAlign: TextAlign.center,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.md,
              ),
            ),
            Image.network(
              imageUrl,
            ),
            Gap(
              XigoResponsive.heightSizeByContext(
                context,
                pixels: XigoSpacing.xxl,
              ),
            ),
            Button(
              title: titleButton,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemPass extends StatelessWidget {
  const ItemPass({
    super.key,
    required this.passNumber,
    required this.passSelected,
    required this.title,
  });
  final int passNumber;
  final int passSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemCircular(
          passNumber: '$passNumber',
          isActive: passNumber == passSelected,
        ),
        Gap(XigoResponsive.withSizeByContext(context, pixels: 5)),
        XigoText.body(
          label: title,
          color:
              passNumber == passSelected ? Colors.black : XigoColors.textColor,
          fontWeight:
              passNumber == passSelected ? FontWeight.bold : FontWeight.w400,
        ),
      ],
    );
  }
}
