part of 'package:verifik/app/screen/demo/page.dart';

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
        ItemAction(
          imageUrl: InitProyectUiValues.demoHeaderPartner,
          title: InitProyectUiValues.partnerWithUs,
          onTap: () {
            Functions.launchInBrowser(
              url: InitProyectUiValues.partnersUrl,
            );
          },
        ),
        ItemAction(
          imageUrl: InitProyectUiValues.demoHeaderSupportAgent,
          title: InitProyectUiValues.talkSales,
          onTap: () {
            Functions.launchInBrowser(
              url: InitProyectUiValues.mettingsUrl,
            );
          },
        ),
        ItemAction(
          imageCountry:
              // "https://demo.verifik.co/assets/images/flags/US.svg"

              widget.imageCountryUrl,
          onTap: () {},
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
    required this.onTap,
  });

  final String imageUrl;
  final String imageCountry;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}