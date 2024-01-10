import 'package:flutter/material.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/text/text.dart';

class ItemCircular extends StatelessWidget {
  const ItemCircular({
    super.key,
    required this.passNumber,
    this.isActive = true,
  });

  final bool isActive;
  final String passNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: XigoResponsive.heightSizeByContext(
        context,
        pixels: 45,
      ),
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? XigoColors.rybBlue
            : XigoColors.rybBlue.withOpacity(0.10),
      ),
      child: Center(
        child: XigoText.body(
          label: passNumber,
          color: Colors.white,
        ),
      ),
    );
  }
}
