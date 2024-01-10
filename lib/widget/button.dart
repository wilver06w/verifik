import 'package:flutter/material.dart';
import 'package:verifik/utils/colors.dart';
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/text/text.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.colorText = Colors.white,
    this.borderColor = XigoColors.majorelleBlue,
    this.backgroundColor,
  });
  final String title;
  final VoidCallback onPressed;
  final Color colorText;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: XigoResponsive.withSizeByContext(
            context,
            pixels: XigoSpacing.xs,
          ),
          vertical: XigoResponsive.heightSizeByContext(
            context,
            pixels: XigoSpacing.sm,
          ),
        ),
        child: XigoText.labelText(
          label: title,
          color: colorText,
        ),
      ),
    );
  }
}
