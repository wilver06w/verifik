part of 'package:verifik/_childrens/demo/page.dart';

class BodyBottom extends StatelessWidget {
  const BodyBottom({
    super.key,
    required this.app,
  });

  final AppConfig app;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: InitProyectUiValues.spacingMedium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            XigoText.labelText(
              label: InitProyectUiValues.textFooter,
            ),
            XigoText.xSmall(
              label: '${InitProyectUiValues.version} ${app.version}',
            ),
          ],
        ),
      ),
    );
  }
}
