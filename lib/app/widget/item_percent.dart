
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/functions.dart';
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/text/text.dart';

class ItemPercent extends StatelessWidget {
  const ItemPercent({
    super.key,
    required this.title,
    required this.percent,
    required this.colorsProgress,
    this.colorText = XigoColors.rybBlue,
  });

  final String title;
  final double percent;
  final Color colorsProgress;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        XigoText.fontSizeCustom(
          label: title,
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          XigoResponsive.withSizeByContext(
            context,
            pixels: XigoSpacing.md,
          ),
        ),
        CircularPercentIndicator(
          radius: 90.0,
          lineWidth: 20.0,
          percent: Functions.convertirAInt(
            value: percent,
          ).toDouble(),
          center: XigoText.fontSizeCustom(
            label: '${Functions.convertirAInt(
              value: percent,
            )}',
            color: colorText,
            fontSize: 35,
          ),
          backgroundColor: XigoColors.azureishWhite,
          progressColor: colorsProgress,
        ),
      ],
    );
  }
}
