part of 'package:verifik/screen/result/page.dart';

class SectionInfo extends StatelessWidget {
  const SectionInfo({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<ItemSection> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        XigoText.fontSizeCustom(
          label: title,
          color: XigoColors.rybBlue.withAlpha(77),
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        ...List.generate(
          items.length,
          (index) {
            final item = items[index];
            return ItemInfo(
              title: item.title,
              subTitle: item.subTitle,
              isLast: items.last == item,
            );
          },
        ),
      ],
    );
  }
}
