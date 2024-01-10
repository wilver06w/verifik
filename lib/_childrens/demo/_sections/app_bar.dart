part of 'package:verifik/_childrens/demo/page.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    super.key,
    this.imageCountryUrl = '',
  });

  final String imageCountryUrl;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: XigoColors.primaryColor,
      title: Image.network(
        InitProyectUiValues.demoHeaderLogoCursorPointer,
        width: 120,
      ),
      actions: [
        const ItemAction(
          imageUrl: InitProyectUiValues.demoHeaderPartner,
          title: InitProyectUiValues.partnerWithUs,
        ),
        const ItemAction(
          imageUrl: InitProyectUiValues.demoHeaderSupportAgent,
          title: InitProyectUiValues.talkSales,
        ),
        ItemAction(
          imageCountry:
              // "https://demo.verifik.co/assets/images/flags/US.svg"

              widget.imageCountryUrl,
        ),
      ],
    );
  }
}

class ItemAction extends StatelessWidget {
  const ItemAction({
    super.key,
    this.imageUrl = '',
    this.title = '',
    this.imageCountry = '',
  });

  final String imageUrl;
  final String imageCountry;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: XigoResponsive.withSizeByContext(
          context,
          pixels: 3,
        ),
      ),
      child: Row(
        children: [
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: 30,
              height: 30,
            ),
          if (imageCountry.isNotEmpty)
            SvgPicture.network(
              imageCountry,
              width: 30,
              height: 30,
            ),
          if (title.isNotEmpty) ...[
            Gap(
              XigoResponsive.withSizeByContext(
                context,
                pixels: XigoSpacing.xxs,
              ),
            ),
            XigoText.body(
              label: title,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ]
        ],
      ),
    );
  }
}
