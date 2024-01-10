part of 'package:verifik/_childrens/demo/page.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Functions.launchInBrowser(
                  url: InitProyectUiValues.linkedinLink,
                );
              },
              child: XigoText.title(
                label: InitProyectUiValues.myName,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: InitProyectUiValues.spacingEight,
            ),
            XigoText.labelText(
              label: InitProyectUiValues.mobileDeveloper,
              color: Colors.black,
            ),
            const SizedBox(
              height: InitProyectUiValues.spacingEight,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  InitProyectUiValues.svgIconWorld,
                  height: InitProyectUiValues.spacingMedium,
                  width: InitProyectUiValues.spacingMedium,
                ),
                const SizedBox(
                  width: InitProyectUiValues.spacingEight,
                ),
                XigoText.labelText(
                  label: InitProyectUiValues.country,
                  color: Colors.black,
                ),
              ],
            ),
            Row(
              children: [
                ItemUrl(
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 110,
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              InitProyectUiValues.imageMe,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
