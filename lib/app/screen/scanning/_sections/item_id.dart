part of 'package:verifik/app/screen/scanning/page.dart';

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
    return Column(
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
          width: XigoResponsive.withSizeByContext(
            context,
            pixels: 260,
          ),
          height: XigoResponsive.heightSizeByContext(
            context,
            pixels: 170,
          ),
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
          backgroundColor: XigoColors.majorelleBlue,
        ),
      ],
    );
  }
}
