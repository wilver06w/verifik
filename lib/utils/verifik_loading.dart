import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:verifik/utils/responsive.dart';
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
            fit: BoxFit.contain,
            height: XigoResponsive.heightSizeByContext(
              context,
              pixels: 100,
            ),
            width: XigoResponsive.heightSizeByContext(
              context,
              pixels: 100,
            ),
          ),
        );
      },
    );
  }
}
