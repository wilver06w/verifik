import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:verifik/app/utils/responsive.dart';
import 'package:verifik/app/utils/spacing.dart';
import 'package:verifik/app/utils/verifik_ui.dart';

class VerifikLoading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Lottie.asset(
            VerifikUiValues.loadingAnimations,
            height: VerifikResponsive.heightSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
            width: VerifikResponsive.withSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
          ),
        );
      },
    );
  }
}
