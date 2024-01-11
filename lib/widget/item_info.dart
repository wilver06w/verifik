import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    this.isLast = false,
    required this.title,
    required this.subTitle,
  });
  final bool isLast;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: XigoColors.azureishWhite,
          height: 10,
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.xs,
          ),
        ),
        XigoText.body(
          label: title,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w800,
        ),
        Gap(
          XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.xs,
          ),
        ),
        XigoText.labelText(
          label: subTitle,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        if (isLast) ...[
          Gap(
            XigoResponsive.heightSizeByContext(
              context,
              pixels: XigoSpacing.xs,
            ),
          ),
          const Divider(
            color: XigoColors.azureishWhite,
            height: 10,
          ),
          Gap(
            XigoResponsive.heightSizeByContext(
              context,
              pixels: XigoSpacing.md,
            ),
          ),
        ]
      ],
    );
  }
}
