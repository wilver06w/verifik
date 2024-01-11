import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:verifik/utils/responsive.dart';
import 'package:verifik/utils/spacing.dart';
import 'package:verifik/utils/xigo_ui.dart';

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
            InitProyectUiValues.loadingAnimations,
            height: XigoResponsive.heightSizeByContext(
              context,
              pixels: XigoSpacing.xs,
            ),
            width: XigoResponsive.withSizeByContext(
              context,
              pixels: XigoSpacing.xs,
            ),
          ),
        );
      },
    );
  }
}
