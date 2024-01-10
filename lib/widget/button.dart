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
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: XigoColors.majorelleBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(
            color: XigoColors.majorelleBlue,
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
          color: Colors.white,
        ),
      ),
    );
  }
}
