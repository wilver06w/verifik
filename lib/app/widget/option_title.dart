import 'package:verifik/app/utils/colors.dart';
import 'package:verifik/app/utils/text/text.dart';
import 'package:flutter/material.dart';

class OptionTitle extends StatelessWidget {
  const OptionTitle({
    super.key,
    required this.onTap,
    required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: VerifikText.labelText(
        label: title,
        color: VerifikColors.textColor,
      ),
    );
  }
}
