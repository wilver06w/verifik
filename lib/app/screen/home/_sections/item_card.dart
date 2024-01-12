part of 'package:verifik/app/screen/home/page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.passNumber,
  });

  final String imageUrl;
  final String title;
  final String passNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: XigoResponsive.heightSizeByContext(
            context,
            pixels: 250,
          ),
          width: XigoResponsive.withSizeByContext(
            context,
            pixels: 45,
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
          margin: EdgeInsets.only(
            bottom: XigoResponsive.heightSizeByContext(
              context,
              pixels: 20,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(
                XigoResponsive.withSizeByContext(
                  context,
                  pixels: XigoSpacing.xs,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  imageUrl,
                  width: XigoResponsive.withSizeByContext(
                    context,
                    pixels: 100,
                  ),
                  height: XigoResponsive.heightSizeByContext(
                    context,
                    pixels: 124,
                  ),
                ),
              ),
              Gap(
                XigoResponsive.heightSizeByContext(
                  context,
                  pixels: XigoSpacing.md,
                ),
              ),
              XigoText.body(
                label: title,
                fontWeight: FontWeight.w600,
                color: XigoColors.catalinaBlue.withOpacity(0.60),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ItemCircular(
            passNumber: passNumber,
          ),
        ),
      ],
    );
  }
}
