part of 'package:verifik/screen/demo/page.dart';

class BodyPass extends StatelessWidget {
  const BodyPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        HeaderPassNumbers(),
        ScanningPage(),
      ],
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
