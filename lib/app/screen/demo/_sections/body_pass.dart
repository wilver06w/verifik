part of 'package:verifik/app/screen/demo/page.dart';

class BodyPass extends StatelessWidget {
  const BodyPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const HeaderPassNumbers(),
        BlocSelector<BlocDemo, DemoState, int>(
          selector: (state) {
            return state.model.numberPass;
          },
          builder: (context, state) {
            Widget value = Container();
            switch (state) {
              case 1:
                value = const ScanningPage();
                break;
              case 2:
                value = const DocumentPage();
                break;
              case 3:
                value = const CameraPage();
                break;
              case 4:
                value = const Result();
                break;
            }

            return value;
          },
        ),
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
